class Public::CartItemsController < Public::ApplicationController
  
   def create
    cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    if cart_item 
      cart_item.amount = cart_item.amount+params[:cart_item][:amount].to_i
    else 
      cart_item = current_customer.cart_items.new(cart_item_params)
    end
    cart_item.save
     redirect_to cart_items_path
   end
   
   def index
    @cart_items = current_customer.cart_items
    
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
      @cart_item= current_customer.cart_items
      @cart_item.destroy_all
      redirect_back(fallback_location: root_path)
   end
  
   private

  def cart_item_params
    params.require(:cart_item).permit(:amount,:item_id)
  end

  
  
end
