class NegotiationsController < ApplicationController
   before_action :authenticate_user!

  def index
     @negotiations = current_user.negotiations_of_driver
     @negotiations.concat(current_user.negotiations_of_hiker)
  end
  

  def show
      @negotiation = Negotiation.find(params[:id])
      session[:negotiation_id] = @negotiation.id
      @posts = @negotiation.posts
      @post = Post.new

  end
  
  def new
      @negotiation = Negotiation.new
  end
 
  def create
      @negotiation = Negotiation.new
      @negotiation.driver_post_id = session[:driver_post_id]
      @negotiation.driver_id = session[:driver_id]
      @negotiation.hiker_id = current_user.id
      #driver = User.find_by(id: session[:driver_id]).name
      #hiker = current_user.name
      title = "出発地:" + session[:origin]\
         + " 目的地: " + session[:destination]\
         + " 出発日: " + session[:departure_date]
      @negotiation.title = title
      
      
      if @negotiation.save
       flash[:success] = "交渉スレッドが開始されました！"
       redirect_to '/negotiations/'+@negotiation.id.to_s
      end
 
  end
  
  def destroy
    @negotiation = Negotiation.find(params[:id])
    @negotiation.destroy
    redirect_to root_url
  end
 
end