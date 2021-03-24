class Public::ItemsController < Public::ApplicationController
  before_action :authenticate_customer!,except: [:index, :show]
  
    def index
      @items = Item.all.page(params[:page]).per(8)
    end

    def show
      @item = Item.find(params[:id])
      @cart_item = CartItem.new
    end
    


    private
    
    def item_params
     params.require(:item).permit(:name, :introduction, :price, :image)
    end

  
end
