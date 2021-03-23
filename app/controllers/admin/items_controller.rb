class Admin::ItemsController < Admin::ApplicationController
  
  def index
    @items = Item.all.page(params[:page]).per(10)
  end
  
  def new
    @item = Item.new
    @genres = Genre.all
  end
  
  def show
    @item = Item.find(params[:id])
    @price = Price.find(tax_price(item.price))
  end
  
  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end
  
  def create
    item = Item.new(item_params)
    if item.save
      redirect_to admin_items_path
    else
      @items = Item.all
      render :index
    end
  end
  
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_items_path
    else
      render :edit
    end
  end
  
  private
  
  def tax_price(price)
    (price * 1.1).floor
  end
  
  def item_params
    params.require(:item).permit(:genre_id, :name, :image, :introduction, :price, :is_active)
  end
  
end
