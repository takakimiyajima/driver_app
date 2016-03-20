class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @posts = Post.all
    respond_with(@posts)
  end

  def show
    respond_with(@post)
  end

  def new
    @post = Post.new
    respond_with(@post)
  end

  def edit
  end

  def create
    #@negotiation = Negotiation.find(params[:nego_id])
    @post = @negotiation.posts.build(post_params)
     max_num = @negotiation.posts.maximum(:post_number)
     max_num = 0 if max_num.blank?
     @post.post_number = max_num + 1

  respond_to do |format|
      if @post.save
        format.html { redirect_to @negotiation, notice: '投稿されました。' }
        format.json { render json: @post, status: :created, location: @negotiation }
      else
        @negotiation = Negotiation.find(params[:nego_id])
        @posts = @negotiation.posts
        format.html { render "negotiations/show" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @negotiation = Negotiation.find(params[:nego_id])
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to @negotiation }
      format.json { head :no_content }
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:contributor, :content)
    end
end
