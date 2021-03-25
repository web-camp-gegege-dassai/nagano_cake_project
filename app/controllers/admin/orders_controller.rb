class Admin::OrdersController < Admin::ApplicationController
  
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end
  
  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to admin_customer_path
    else
      render :show
    end
  end

  private

  def order_params
    params.require(order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end
  
  # def order_detail_params
  #   params.require(order_detail).permit(:order_id, :item_id, :price, :amount, :making_status)
  # end
  
end
