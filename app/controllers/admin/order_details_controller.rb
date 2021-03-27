class Admin::OrderDetailsController < Admin::ApplicationController

  def update
  	@order_detail = OrderDetail.find(params[:id])
  	if @order_detail.update(order_details_params)
  		flash[:success] = "制作ステータスを変更しました"
  		redirect_to admin_order_path(@order_detail.order)
  	else
  		 render "show"
  	end
  end

  def update
  	@order_detail = OrderDetail.find(params[:id])
  	if @order_detail.update(order_details_params)
  		flash[:notice] = "制作ステータスを変更しました"
      if @order_detail.making_status == '製作中'
        orders = @order_detail.order
        orders.update(status:"製作中")
      elsif @order_detail.order.order_details.count == OrderDetail.where(making_status: "製作完了").count
        orders = @order_detail.order
        orders.update(status:"発送準備中")
      end
    	redirect_to admin_order_path(@order_detail.order)
  	else
  	  flash[:alert] = "変更できませんでした！"
  		 render "show"
  	end
  end

 private

  def order_details_params
    params.require(:order_detail).permit(:making_status)
  end

end
