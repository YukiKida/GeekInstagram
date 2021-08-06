class ImgpostsController < ApplicationController

  before_action :authenticate_user!

  def index
    @imgposts = Imgpost.all
  end

  def new
    @imgpost = Imgpost.new
  end

  def create
    imgpost = Imgpost.new(imgpost_params)
    if imgpost.save
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  private
  def imgpost_params
    params.require(:imgpost).permit(:title, :body, :image)
  end
end

