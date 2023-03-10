class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!,only: [:create,:edit,:update,:index]

  def index
    @genre = Genre.new
    @genres = Genre.all
  end
  
  def create
    @genre =Genre.new(genre.params)
    if @genre.save
      redirect_to admins_genre_path
    else
      flash[:genre_create_error] = "ジャンル名を入力してください"
      redirect_to
    end
  end
    
  def edit
    @genre = Genre.find(params[:id])
  end
    
  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admins_genre_path
      flash[:notice_update] = "ジャンル情報を更新しました"
    else
      render 'edit'
    end
  end
  
  
  private
  def genre_params
    params.require(:genre).permit(:name, :is_genre_status)
  end
  
end
