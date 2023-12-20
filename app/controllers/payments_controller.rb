class PaymentsController < ApplicationController
  before_action :authenticate_customer!

  def index
      if customer_signed_in? && current_customer.cart_items.any?
          @payment_details = current_customer.payment_details
          render :index
      else
          flash.now[:error] = 'You are not allowed to access this page.'
          redirect_to root_path
      end
  end

  def new
      @payment_detail = PaymentDetail.new
      render :new
  end

  def create_new_payment
      @payment_detail = current_customer.payment_details.build(payment_detail_params)
    
      if @payment_detail.save
        flash[:success] = 'Payment method created successfully!'
        redirect_to payment_details_path
      else
        if @payment_detail.errors[:card_no].include?("has already been taken")
          flash.now[:error] = 'Payment method with this card number already exists.'
        else
          flash.now[:error] = 'Failed to create payment method.'
        end
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      @payment_detail = current_customer.payment_details.find(params[:id])
      render :edit
    end
  
    def update
      @payment_detail = current_customer.payment_details.find(params[:id])
    
      if @payment_detail.update(payment_detail_params)
        flash[:success] = 'Payment method updated successfully!'
        redirect_to payment_details_path
      else
        flash.now[:error] = 'Failed to update payment method.'
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @payment_detail = current_customer.payment_details.find(params[:id])
      @payment_detail.destroy
      flash[:success] = 'Payment method deleted successfully!'
      redirect_to payment_details_path
    rescue ActiveRecord::RecordNotFound
      flash[:error] = 'Payment method not found.'
      redirect_to payment_details_path
    end

    private

    def payment_detail_params
      params.require(:payment_detail).permit(:card_no, :card_type, :exp, :cvv)
    end
end