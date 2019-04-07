class ItemsController < ApplicationController
  before_action :find_bucketlist_items
  before_action :find_bucketlist_item, only: [:edit, :update, :show, :destroy]

  def index
    @pending_items = @bucketlist_items.where(complete: false)
    @complete_items = @bucketlist_items.where(complete: true)
  end

  def new
    @bucketlist_item = @bucketlist_items.new
  end

  def create
    @bucketlist_item_cre = @bucketlist_items.create!(item_params)

    respond_to do |format|
      format.html { redirect_to bucketlist_items_path(@bucketlist) }
      format.js
    end
  end

  def show; end

  def update
    if item_params[:complete] == "1"
      @item.update(complete: true)
    else
      @item.update(complete: false)
    end

    respond_to do |format|
      format.html { redirect_to bucketlist_items_path(@bucketlist) }
      format.js
    end
  end

  def destroy
    @item.destroy

    respond_to do |format|
      format.html { redirect_to bucketlist_items_path(@bucketlist) }
      format.js
    end
  end

  private

  def find_bucketlist_items
    @bucketlist = Bucketlist.find(params[:bucketlist_id])
    @bucketlist_items = @bucketlist.items
  end

  def find_bucketlist_item
    @item = Item.find_by(id: params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :id, :complete)
  end
end
