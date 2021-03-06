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
  end
  
  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end
  
  def create
    item = Item.new(item_params)
    if item.save
      flash[:notice] = "新規商品が登録されました。"
      redirect_to admin_item_path(item.id)
    else
      flash[:alert] = "新規商品が登録に失敗しました。"
      @items = Item.all
      render :new
    end
  end
  
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "商品内容が更新されました。"
      redirect_to admin_items_path
    else
      flash[:alert] = "商品内容の変更に失敗しました。"
      render :edit
    end
  end
  
  private
  
  def item_params
    params.require(:item).permit(:genre_id, :name, :image, :introduction, :price, :is_active)
  end
  
end