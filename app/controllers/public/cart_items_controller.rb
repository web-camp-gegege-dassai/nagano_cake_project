class Public::CartItemsController < Public::ApplicationController
  
   def create
    @item = Item.find(params[:item_id])
    @cart_item = CartItems.new
    amount = @item.cart_items.new(cart_item_params)
    amount.item_id = @item.id
    amount.customer_id = current_user.id
    amount.save
    redirect_to cart_items_path(@cart_item.id)
   end
  
   private

  def cart_item_params
    params.require(:cart_item).permit(:amount)
  end

  
  
end
