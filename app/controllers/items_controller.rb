class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @photo = Photo.find_by(item_id: @item.id)
    item_tags = ItemTag.find_by_sql("select * from item_tags where item_id = #{@item.id};")
    @tag_1 = Tag.find(item_tags[0].tag_id)
    @tag_2 = Tag.find(item_tags[1].tag_id)
  end

  def new
  end

  def create
    # save item
    @item = Item.create!(item_params)

    # save tag
    if Tag.find_by(name: params[:tag][:tag_1]).nil?
      @tag_1 = Tag.create!(name: params[:tag][:tag_1])
    else
      @tag_1 = Tag.find_by(name: params[:tag][:tag_1])
    end

    if Tag.find_by(name: params[:tag][:tag_2]).nil?
      @tag_2 = Tag.create!(name: params[:tag][:tag_2])
    else
      @tag_2 = Tag.find_by(name: params[:tag][:tag_2])
    end

    # save item_tag relationship
    @item_tag_1 = ItemTag.create!(item_id: @item.id, tag_id: @tag_1.id)
    @item_tag_2 = ItemTag.create!(item_id: @item.id, tag_id: @tag_2.id)

    # save photo
    @photo = Photo.new(image: params[:item][:image], item_id: @item.id)

    if @photo.save
      redirect_to :action => 'index'
    else
      print 'error'
    end

  end

  def edit
    @item = Item.find(params[:id])
    item_tags = ItemTag.find_by_sql("select * from item_tags where item_id = #{@item.id};")
    @item_tag_1 = item_tags[0]
    @item_tag_2 = item_tags[1]
    if @item_tag_1.nil?
      @tag_1 = Tag.new
      @tag_2 = Tag.new
    else
      @tag_1 = Tag.find(@item_tag_1.tag_id)
      @tag_2 = Tag.find(@item_tag_2.tag_id)
    end
    @photo = Photo.find_by(item_id: @item.id)
    @photo.image.cache! unless @photo.image.blank?
  end

  def update
    @item = Item.find(params[:id])
    @tag_1 = Tag.find(params[:item][:tag_1_id])
    @tag_2 = Tag.find(params[:item][:tag_2_id])
    @photo = Photo.find(params[:item][:photo_id])
    # @item_tag_1 = ItemTag.find(params[:item_tag_1_id])
    # @item_tag_2 = ItemTag.find(params[:item_tag_2_id])

    @item.update(item_params)
    @tag_1.update(name: params[:tag][:tag_1])
    @tag_2.update(name: params[:tag][:tag_2])
    unless params[:item][:image].nil?
      @photo.update(photo_params)
    end
    
    redirect_to @item
  end

  private
    def item_params
      params.require(:item).permit(:title, :comment, :url)
    end

    def photo_params
      params.require(:item).permit(:image)
    end

  # private finished

end
