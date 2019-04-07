class BucketlistsController < ApplicationController
  before_action :find_bucketlist, only: [:show, :update]

  def index
    @bucketlists = Bucketlist.all.last(5)
  end

  def new
    @bucketlist = Bucketlist.new
  end

  def create
    @bucketlist = Bucketlist.create!(bucket_params)

    respond_to do |format|
      format.html { redirect_to bucketlists_path }
      format.js
    end
  end

  def show; end

  def update
    @bucketlist.update_attributes!(bucket_params)

    respond_to do |format|
      format.html { redirect_to bucketlist_path(@bucketlist) }
      format.js
    end
  end

  def destroy
    @bucketlist = Bucketlist.destroy(params[:id])

    respond_to do |format|
      format.html { redirect_to bucketlists_path }
      format.js
    end
  end

  private

  def bucket_params
    params.require(:bucketlist).permit(:name)
  end

  def find_bucketlist
    @bucketlist = Bucketlist.find(params[:id])
  end
end
