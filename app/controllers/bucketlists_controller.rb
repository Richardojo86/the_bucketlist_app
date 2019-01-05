class BucketlistsController < ApplicationController
  # def index
  #   @bucketlists = Bucketlist.all
  #   respond_to do |format|
  #     format.html { render: index }
  #     format.json { render json: @bucketlists, each_serializer: BucketlistSerializer }
  #   end
  # end

  def new
    @bucketlist = Bucketlist.new(params[:name]) 
  end


  # def create
  #   @bucketlist = Bucketlist.new(name)
  #   if @bucketlist.valid?
  #     @bucketlist.save
  #     redirect_to bucketlist_path
  #   else
  #     render :new
  #   end
  # end

  def create
    @bucketlist = Bucketlist.create(params[:name])
    respond_to do |format|
      format.html { redirect_to bucketlist_path }
      format.js
    end
  end
end
