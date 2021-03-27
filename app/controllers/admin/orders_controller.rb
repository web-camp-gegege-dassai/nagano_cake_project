class Admin::OrdersController < Admin::ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      flash[:notice] = "変更しました。"
      if @order.status == '入金確認'
        order_details = @order.order_details
        order_details.update(making_status: "製作待ち")
      end
      redirect_to admin_order_path(@order)

    else
      flash[:alert] = "変更できませんでした。"
      render :show
    end
  end



  private

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end

end