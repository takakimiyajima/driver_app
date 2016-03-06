class MicropostsController < ApplicationController
  before_action :authenticate_user!

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      render 'main_pages/home'
    end
  end

  def destroy
  end
  
  
        private
    
        def micropost_params
          params.require(:micropost).permit(:content)
        end
  
end