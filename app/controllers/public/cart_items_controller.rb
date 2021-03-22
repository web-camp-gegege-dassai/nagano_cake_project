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
   
   def index
    @customer = current_customer
    @cart_item = @customer.cart_items
   end

   def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
    flash[:notice] = "You have updated user successfully."
    redirect_back(fallback_location: root_path)
    end
   end
   
   def destroy
     CartItem.find(params[:id]).destroy
     redirect_back(fallback_location: root_path)
   end

   def destroy_all
      @cart_item= current_cart_item
      @cart_item.destroy
   end
   

   private

  def cart_item_params
    params.require(:cart_item).permit(:amount)
  end

  
  
end
