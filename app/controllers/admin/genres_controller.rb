class Admin::GenresController < Admin::ApplicationController

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    genre = Genre.new(genre_params)
    if genre.save
      flash[:notice] = "新規ジャンルを追加しました。"
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = "ジャンルが入力されていません。"
      redirect_back(fallback_location: root_path)
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:notice] = "ジャンルを編集しました。"
      redirect_to admin_genres_path
    else
      flash[:alert] = "ジャンルが入力されていません。"
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
