class Public::OrdersController < Public::ApplicationController

  def new
    @order = Order.new
    @address = Address.where(customer: current_customer)
  end

  def confirm
    @cart_items = current_cart
    @order = Order.new(
      customer: current_customer,
      payment_method: params[:order][:payment_method]
      )
      
      @order.total_payment = billing(@order)
      
      if params[:order][:shipping_address] == "my_address"
      end
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




def total_price(totals)
    price = 0
    totals.each do |total|
      price  +=  sub_price(total)
    end
    return price
  end