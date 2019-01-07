class BucketlistsController < ApplicationController

  def index
    @bucketlists = Bucketlist.all
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @bucketlists, each_serializer: BucketlistSerializer }
    end
  end

  def new
    @bucketlist = Bucketlist.new(params[:name])
    respond_to do |format|
      format.html { render :template => "bucketlists/_form"}
      format.js { }
    end
  end

  def create
    @bucketlist  = Bucketlist.create(bucket_params)
    flash[:notice] = "successfully created"
    redirect_to bucketlists_path
    # respond_to do |format|
    #   format.html { redirect_to bucketlists_path }
    #   format.js { }
    # end
  end

  # def show
  #   @bucketlist = Bucketlist.find(params[:id])
  # end

  # def create
  #   @bucketlist = Bucketlist.new(name)
  #   if @bucketlist.valid?
  #     @bucketlist.save
  #     redirect_to bucketlist_path
  #   else
  #     render :new
  #   end
  # end

  # def create
  #   @bucketlist = Bucketlist.create(params[:name])
  #   respond_to do |format|
  #     format.html { redirect_to bucketlist_path }
  #     format.js
  #   end
  # end
  #


  # def all_bucketlists
  #   @bucketlist = Bucketlist.all
  # end

  private

  def bucket_params
    params.require(:bucketlist).permit(:name)
  end
end
