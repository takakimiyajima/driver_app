class PostsController < ApplicationController
  #before_action :set_post, only: [:show, :update, :destroy]
  before_action :authenticate_user!
  before_action :correct_user,   only: :destroy

  respond_to :html

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
     @negotiation = Negotiation.find(session[:negotiation_id])
     @post = @negotiation.posts.build(post_params)
     @post.user_id = current_user.id

   respond_to do |format|
      if @post.save
        #メーラー
        if current_user.id == Negotiation.find(@post.negotiation_id).driver_id
           address = User.find(Negotiation.find(@post.negotiation_id).hiker_id).email
        else
           address = User.find(Negotiation.find(@post.negotiation_id).driver_id).email
        end
      PostMailer.sent(address, @post.content).deliver
           
        format.html { redirect_to @negotiation, notice: '投稿されました。' }
        format.json { render json: @post, status: :created, location: @negotiation }
      else
        @negotiation = Negotiation.find(session[:negotiation_id])
        @posts = @negotiation.posts
        format.html { render "negotiations/show" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
   end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
     @negotiation = Negotiation.find(session[:negotiation_id])
     @post = Post.find(params[:id])
     @post.destroy
     redirect_to '/negotiations/'+@negotiation.id.to_s

  end

  private

    def post_params
      params.require(:post).permit(:content, :negotiation_id)
    end
    
    def correct_user
      @post = Post.find_by(id: params[:id])
     # redirect_to root_url if @post.nil?
    end
end
