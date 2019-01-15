class ItemsController < ApplicationController
  before_action :find_bucketlist_items

  def index
    @pending_items = @bucketlist_items.where(complete: false)
    @complete_items = @bucketlist_items.where(complete: true)
  end

  def new
    @item = @bucketlist_items.new
  end

  def create
    @item = @bucketlist_items.create!(params[:name])

    respond_to do |format|
      format.html { redirect_to bucketlist_items_path(bucketlist) }
      format.js
    end
  end

  def update
    @bucketlist_items.update_attributes!(params[:complete])

    respond_to do |format|
      format.html { redirect_to bucketlist_items_path(bucketlist) }
      format.js
    end
  end

  private

  def find_bucketlist_items
    @bucketlist = Bucketlist.find(params[:bucketlist_id])
    @bucketlist_items = @bucketlist.items
  end

  def bucketlist
    @bucketlist_items.bucketlist
  end
end
