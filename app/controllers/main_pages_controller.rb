class MainPagesController < ApplicationController
  
  def home
    if signed_in?
       @negotiations = current_user.negotiations_of_driver
       @negotiations.concat(current_user.negotiations_of_hiker)
      # @negotiations = Negotiation.paginate(page: params[:page])
     
       @q = DriverPost.search(params[:q])
       @driver_posts = @q.result(distinct: true)
    end
    
  end

  def help
  end
  
  def contact
  end
  
  def language
  end
end
