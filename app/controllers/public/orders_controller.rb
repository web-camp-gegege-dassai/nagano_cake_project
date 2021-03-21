class Public::OrdersController < Public::ApplicationController

  def new
    @order = Order.new
    @address = Address.where(customer: current_customer)
  end

  def confirm
    @order = Order.new(customer: current_customer)
  end

  def complete
  end

  def create
  end

  def index
  end

  def show
  end


end
