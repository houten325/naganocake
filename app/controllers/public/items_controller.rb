class Public::ItemsController < ApplicationController

  def index
    @genres = Genre.all
    @items_all = Item.all
    @items = @search.result.page(params[:page]).per(8)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end

end
