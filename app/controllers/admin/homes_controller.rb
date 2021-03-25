class Admin::HomesController < Admin::ApplicationController

  def top
    @orders = Order.all.page(params[:page]).reverse_order
  end

end
