class BucketlistsController < ApplicationController
  before_action :find_bucketlist, only: [:show, :update]

  def index
    @bucketlists = Bucketlist.all.last(5)
    respond_to do |format|
      format.html
      format.json {render json: @bucketlists}

  end
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

  def show;
    respond_to do |f|
      f.html
      f.json {render json: @post}
    end
   end

  def update
    bucketlist = @bucketlist.update_attributes(bucket_params)
    if bucketlist
      flash[:success] = "Bucketlist updated successfully"
    else
      flash[:error] = "could not update bucketlist"
    end
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
