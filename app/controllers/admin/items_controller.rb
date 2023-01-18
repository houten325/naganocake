class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!,only: [:create,:edit,:update,:index, :show, :new]
  
  def new
    @items = Item.new
  end
  
  def index
  end
  
  def show
    @item = Iten.find(params[:id])
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admins_item_path(@item)
    else
      flash[:genre_create_error] = "ジャンル名を入力してください"
    redirect_to new_admins_items_path
    end
  end
  
  def edit 
    @item = Item.find(params[:id])
  end
  
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admins_items_path(@item)
      flash[:notice_update] = "ジャンル情報を更新しました"
    else
      redirect_to edit_admins_item_path(@item)
    end
  end
  
  
  private
  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :image, :price, :is_active)
  end
end
