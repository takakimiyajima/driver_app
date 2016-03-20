class MainPagesController < ApplicationController
  def home
    if signed_in?
      @driver_post = current_user.driver_posts.build
    end
  end

  def help
  end
  
  def contact
  end
  
  def language
  end
end
