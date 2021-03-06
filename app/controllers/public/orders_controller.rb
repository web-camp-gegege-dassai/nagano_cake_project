class Public::OrdersController < Public::ApplicationController
  before_action :authenticate_customer!
  include ApplicationHelper

  def new
    @order = Order.new
    @address = Address.where(customer: current_customer)
  end

  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new(
      customer: current_customer,
      payment_method: params[:order][:payment_method]
    )
    @order.shipping_cost = 800
    @order.total_payment = billing(@order)
    @selected_address = params[:order][:shipping_address]

    if @selected_address == "my_address"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name

    elsif @selected_address == "registered_address"
      registered = Address.find(params[:order][:address_id])
      @order.postal_code = registered.postal_code
      @order.address = registered.address
      @order.name = registered.name

    elsif @selected_address == "new_address"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
      @address_new = 1

      unless @order.valid? == true
        @address = Address.where(customer: current_customer)
        flash[:alert] = "有効な配送先住所ではありません。"
        render :new
      end

    end
  end

  def complete
  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.save
    flash[:notice] = "ご注文が確定しました。"
    redirect_to complete_orders_path


    if params[:order][:address_new] == "1"
      new_address = Address.new(address_params)
      new_address.customer_id = current_customer.id
      new_address.save
    end

    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      OrderDetail.create(
        order: @order,
        item: cart_item.item,
        amount: cart_item.amount,
        price: sub_price(cart_item)
        )
    end

    @cart_items.destroy_all
  end

  def index
    @orders = current_customer.orders.page(params[:page]).per(10).reverse_order
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment_method, :total_payment)
  end

  def address_params
    params.require(:order).permit(:postal_code, :address, :name)
  end
end


