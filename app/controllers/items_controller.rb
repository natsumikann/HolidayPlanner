class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new

  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to :action => 'index'
  end

  def edit
    @item = Item.find(params[:id])

  end

  private
    def item_params
      params.require(:item).permit(:title, :comment, :url)
    end
end
