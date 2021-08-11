class ImgpostsController < ApplicationController

  before_action :authenticate_user!

  def index
    if params[:search] == nil
      @imgposts = Imgpost.all
    elsif params[:search] == ''
      @imgposts = Imgpost.all
    else
      @imgposts = Imgpost.where("body LIKE ? ", '%' + params[:search] + '%')
    end
  end

  def new
    @imgpost = Imgpost.new
  end

  def create
    imgpost = Imgpost.new(imgpost_params)
    imgpost.user_id = current_user.id
    if imgpost.save
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  def show
    @imgpost = Imgpost.find(params[:id])
    @comments = @imgpost.comments
    @comment = Comment.new
  end

  def edit
    @imgpost = Imgpost.find(params[:id])
  end

  def update
    imgpost = Imgpost.find(params[:id])
    if imgpost.update(imgpost_params)
      redirect_to :action => "show", :id => imgpost.id
    else
      redirect_to :action => "new"
    end
  end

  def destroy
    imgpost = Imgpost.find(params[:id])
    imgpost.destroy
    redirect_to action: :index
  end

  private
  def imgpost_params
    params.require(:imgpost).permit(:title, :body, :image)
  end
end

