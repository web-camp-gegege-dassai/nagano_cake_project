class Public::CartItemsController < Public::ApplicationController
   
   def create
    @item = Item.find(params[:item_id])
    cart_items = current_user.cart_items.new(item_id: @item.id)
    cart_items.save
  end 
  
end
