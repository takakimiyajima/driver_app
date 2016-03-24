class DriverPostsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user,   only: :destroy
  
  
  def new
      @driver_post = current_user.driver_posts.build  if signed_in?
  end
  
  
  def create
    @driver_post = current_user.driver_posts.build(driver_post_params)
    if @driver_post.save
      flash[:success] = "Registered!!"
      redirect_to root_url
    else
      render 'main_pages/home'
    end
  end
  
  def index
    @driver_posts = DriverPost.all
  end

  def show
    @driver_post = DriverPost.find(params[:id])
    session[:origin] = @driver_post.origin
    session[:destination] = @driver_post.destination
    session[:departure_date] = @driver_post.departure_date
    #session[:content] = @driver_post.content
    session[:driver_post_id] = @driver_post.id
    session[:driver_id] = @driver_post.user_id
  end

  def destroy
    @driver_post.destroy
    redirect_to root_url
  end
  
    private
    
    def driver_post_params
      params.require(:driver_post).permit(:origin, :destination, :departure_date, :content, :user_id)
    end
    
    def correct_user
      @driver_post = current_user.driver_posts.find_by(id: params[:id])
      redirect_to root_url if @driver_post.nil?
    end
end
