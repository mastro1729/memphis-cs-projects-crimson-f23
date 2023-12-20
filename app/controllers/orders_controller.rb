class OrdersController < ApplicationController
  before_action :authenticate_vendor!, only: [:vendor_order_details, :is_delivered, :cancel_customer_order]
  before_action :authenticate_customer!, only: [:customer_order_details, :order_confirmation, :create_order, :order_summary]

    def vendor_order_details
      @orders = Order.all.reverse_order
      render 'vendor_order_update'
    end

    def customer_order_details
      @orders = current_customer.orders.all
      render 'customer_orders'
    end

    def is_delivered
      order = Order.find(params[:id])

      @purchase_histories = order.purchase_histories
      total_order_price = @purchase_histories.sum { |item| item.candle_quantity * item.candle_price }

      reward = if total_order_price > 30
        5
      elsif total_order_price > 15
        3
      elsif total_order_price > 8
        1
      else
        0
      end

      @earned_reward = reward
      global_reward = order.customer.global_reward

      if global_reward.present?
      global_reward.reward_points_remaining += @earned_reward
      global_reward.save
      else
      global_reward = GlobalReward.create(
        reward_points_remaining: @earned_reward,
        customer: order.customer
      )
      end
    
      if order.update(status: 'picked-up')
        flash[:success] = 'Order status updated to delivered successfully!'
        render json: { message: 'picked-up' }, status: :ok
      else
        flash[:error] = 'Failed to update order status.'
        render json: { error: 'Failed to deliver order!' }, status: :unprocessable_entity
      end

    rescue ActiveRecord::RecordNotFound
      flash[:error] = 'Order not found!'
      render json: { error: 'Order not found!' }, status: :not_found
    end

    def cancel_customer_order
      order = Order.find(params[:id])
  
      if order.status == 'need_to_pick_up'
        ActiveRecord::Base.transaction do
          order.update(status: 'cancelled')
  
          render json: { message: 'cancelled' }, status: :ok
        end
      else
        render json: { error: 'Order cannot be cancelled.' }, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Order not found!' }, status: :not_found
    end
  
    def order_confirmation
        if customer_signed_in? && current_customer.cart_items.any?
          selected_payment_id = params[:payment_method]
          if selected_payment_id.blank? || !current_customer.payment_details.pluck(:id).include?(selected_payment_id.to_i)
            flash[:error] = 'Selected payment method does not exist.'
            redirect_back(fallback_location: root_path)
            return
          end
          payment_detail = PaymentDetail.find(selected_payment_id)
        
          total_price = current_customer.cart_items.sum { |cart_item| cart_item.candle.price * cart_item.quantity }
        
          reward = if total_price > 30
                     5
                   elsif total_price > 15
                     3
                   elsif total_price > 8
                     1
                   else
                     0
                   end
      
          @order_details = {
            customer: current_customer,
            payment_detail: payment_detail,
            status: 'need_to_pick_up',
            is_payment_done: :not_done,
            reward_earned: reward
          }

          global_reward = current_customer.global_reward

          if global_reward.present?
            earned_reward = global_reward.reward_points_remaining
            total_order_price = current_customer.cart_items.sum { |cart_item| cart_item.candle.price * cart_item.quantity }
  
            if earned_reward >= total_order_price
              @discount_from_rewards = total_order_price
              @adjusted_total_order_price = 0
            else
              @adjusted_total_order_price = total_order_price - earned_reward
              @discount_from_rewards = earned_reward
            end
          else
            @adjusted_total_order_price = total_price
            @discount_from_rewards = 0
          end


          @cart_items = current_customer.cart_items
      
          render 'order_confirmation'
        else
          flash[:error] = 'You are not allowed to access this page.'
          redirect_to root_path
        end
      end

      def create_order
        if customer_signed_in? && current_customer.cart_items.any?
          selected_payment_id = params[:payment_method]
          payment_detail = PaymentDetail.find(selected_payment_id)
      
          total_price = current_customer.cart_items.sum { |cart_item| cart_item.candle.price * cart_item.quantity }
        
          reward = if total_price > 30
                     5
                   elsif total_price > 15
                     3
                   elsif total_price > 8
                     1
                   else
                     0
                   end
        
          order = Order.new(
            customer: current_customer,
            payment_detail: payment_detail,
            status: 'need_to_pick_up',
            is_payment_done: true,
            order_reward: reward
          )
        
          if order.save

            current_customer.cart_items.each do |cart_item|
              purchase_history = PurchaseHistory.new(
                candle_name: cart_item.candle.name,
                candle_desc: cart_item.candle.description,
                candle_pet_type: cart_item.candle.pet_type,
                candle_price: cart_item.candle.price,
                candle_quantity: cart_item.quantity,
                payment_card_no: payment_detail.card_no,
                payment_card_type: payment_detail.card_type,
              )
              purchase_history.image.attach(cart_item.candle.image.blob)
      
              purchase_history.order = order
              if purchase_history.save
                flash[:success] = 'Order placed successfully!'
              else
                flash[:error] = 'Failed to place the order.'
                redirect_to root_path and return
              end
            end
                  
            current_customer.cart_items.destroy_all
        
            flash[:success] = 'Order placed successfully!'
            redirect_to order_summary_path(order)
          else
            flash[:error] = 'Failed to place the order.'
            redirect_to root_path
          end
        else
          flash[:error] = 'You are not allowed to access this page.'
          redirect_to root_path
        end
      end

      def order_summary
        @order = Order.find(params[:id])
        @customer = @order.customer
        @payment_detail = @order.payment_detail
        @purchase_histories = @order.purchase_histories
        total_order_price = @purchase_histories.sum { |item| item.candle_quantity * item.candle_price }

        global_reward = @customer.global_reward

        if global_reward.present?
          earned_reward = global_reward.reward_points_remaining

          if earned_reward >= total_order_price
            @discount_from_rewards = total_order_price
            @adjusted_total_order_price = 0
            global_reward.update(reward_points_remaining: earned_reward - total_order_price)
          else
            @adjusted_total_order_price = total_order_price - earned_reward
            @discount_from_rewards = earned_reward
            global_reward.update(reward_points_remaining: 0)
          end
        else
          @adjusted_total_order_price = total_order_price
          @discount_from_rewards = 0
        end

        reward = if total_order_price > 30
          5
        elsif total_order_price > 15
          3
        elsif total_order_price > 8
          1
        else
          0
        end
  
        @earned_reward = reward

        render 'order_summary'
    end

end
