class CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items
    render :index
  end

  def createorincrease
    if current_customer
      existing_cart_item = CartItem.find_by(candle_id: cart_item_params[:candle_id], customer_id: current_customer.id)

      if existing_cart_item
        existing_cart_item.quantity += 1
        @cart_item = existing_cart_item
      else
        @cart_item = CartItem.new(cart_item_params)
        @cart_item.quantity = 1
        @cart_item.customer_id = current_customer.id
      end

      if @cart_item.save
        update_inventory(@cart_item.candle, -1) # Decrease inventory by 1
        broadcast_cart_total_and_inventory(@cart_item.candle)
        render json: { quantity: @cart_item.quantity, inventory_count: @cart_item.candle.inventory.count }
      else
        render json: { error: "Candle has not been added to the cart" }, status: :unprocessable_entity
      end
    else
      render json: { error: "Please sign in to add items into the cart..!" }, status: :unprocessable_entity
    end
  end

  def decrease
    @cart_item = CartItem.find_by(candle_id: cart_item_params[:candle_id], customer_id: current_customer.id)

    if @cart_item
      if @cart_item.quantity > 1
        @cart_item.quantity -= 1
        if @cart_item.save
          update_inventory(@cart_item.candle, 1) # Increase inventory by 1
          broadcast_cart_total_and_inventory(@cart_item.candle)
          render json: { quantity: @cart_item.quantity, inventory_count: @cart_item.candle.inventory.count }
        else
          render json: { error: "Failed to update quantity" }, status: :unprocessable_entity
        end
      else
        @cart_item.destroy
        update_inventory(@cart_item.candle, 1) # Increase inventory by 1
        broadcast_cart_total_and_inventory(@cart_item.candle)
        render json: { quantity: 0, inventory_count: @cart_item.candle.inventory.count }
      end
    else
      render json: { error: "Candle not found in the cart" }, status: :unprocessable_entity
    end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:candle_id, :quantity)
  end

  def broadcast_cart_total_and_inventory(candle)
    total_count = current_customer ? current_customer.cart_items.sum(:quantity).to_i : 0
    inventory_count = candle.inventory.count.to_i
    ActionCable.server.broadcast("cart_channel", { total_count: total_count, inventory_count: inventory_count })
  end

  def update_inventory(candle, quantity_change)
    candle.inventory.count += quantity_change
    candle.inventory.save
  end
end