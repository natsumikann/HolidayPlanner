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
    # save item
    @item = Item.create!(item_params)

    # save tag
    if Tag.find_by(name: params[:tag][:tag_1]).nil?
      @tag_1 = Tag.create!(name: params[:tag][:tag_1])
    end

    if Tag.find_by(name: params[:tag][:tag_2]).nil?
      @tag_2 = Tag.create!(name: params[:tag][:tag_2])
    end

    # save item_tag relationship
    @item_tag_1 = ItemTag.create!(item_id: @item.id, tag_id: @tag_1.id)
    @item_tag_2 = ItemTag.create!(item_id: @item.id, tag_id: @tag_2.id)

    redirect_to :action => 'index'
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to @item
    else
      render 'edit'
    end
  end

  private
    def item_params
      params.require(:item).permit(:title, :comment, :url)
    end

  # private finished

end
