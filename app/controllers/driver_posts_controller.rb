class DriverPostsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user,   only: :destroy
  
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
    @user = User.find(params[:id])
    @driver_posts = @user.driver_posts.paginate(page: params[:page])
  end

  def destroy
  end
  
    private

    def driver_post_params
      params.require(:driver_post).permit(:origin, :destination, :departure_date, :user_id)
    end
end
