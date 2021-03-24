class Admin::HomesController < Admin::ApplicationController

  def top
    @order_details = OrderDetail.page(params[:page]).reverse_order
  end

end
