class Admin::ItemsController < Admin::ApplicationController
  
  def index
    @items = Item.all
  end
  
  def new
    @item = Item.new
  end
  
  def show
    @item = Item.find(params[:id])
  end
  
  def edit
    @item = Item.find(params[:id])
  end
  
  def create
    item = Item.new(item_params)
    if item.save
      redirect_to item_path(@item), notice: 'Item was successfully created.'
    else
      @items = Item.all
      render :index
    end
  end
  
  def update
    if @item.update(item_params)
      redirect_to item_path(@item), notice: "You have updated item successfully."
    else
      render :edit
    end
  end
  
  private
  
  def item_params
    params.require(:item).permit(:genre, :name, :introduction, :image, :price, :is_active)
  end
  
end
