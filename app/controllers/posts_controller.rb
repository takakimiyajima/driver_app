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
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.build(post_params)
     max_num = @topic.posts.maximum(:post_number)
     max_num = 0 if max_num.blank?
     @post.post_number = max_num + 1

  respond_to do |format|
      if @post.save
        format.html { redirect_to @topic, notice: '投稿されました。' }
        format.json { render json: @post, status: :created, location: @topic }
      else
        @topic = Topic.find(params[:topic_id])
        @posts = @topic.posts
        format.html { render "topics/show" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to @topic }
      format.json { head :no_content }
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:contributor, :content, :post_number)
    end
end
