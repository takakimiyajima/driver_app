class MainPagesController < ApplicationController
  
  def home
     @negotiations = current_user.negotiations_of_driver
     @negotiations.concat(current_user.negotiations_of_hiker)
  end

  def help
  end
  
  def contact
  end
  
  def language
  end
end
