class PostsController < ApplicationController
  before_action :post_find, except: [:index, :new, :create]
  def index
    @posts = Post.all
  end

  def show
    # @post= Post.find(params[:id])

		@comments = Comment.where(post_id: @post)

  end

  def edit
    # @post = Post.find(params[:id])
    @post = Post.find(params[:id])

  end

  def update
    # @post = Post.find(params[:id])
    # @post.title = params[:title]
    # @post.content = params[:content]
    # @post.save

    # redirect_to '/posts/index'

    @post = Post.find(params[:id])
    post_param = params.require(:post).permit(:title, :content)
    @post.update(post_param)
    redirect_to posts_path(p)
  end

  def new
    # @post = Post.new
    @post = Post.new
  end

  def create
    # @post = Post.new
    # @post.title = params[:title]
    # @post.content = params[:content]
    # @post.save
    #
    # redirect_to '/posts/index'

    post_param = params.require(:post).permit(:title, :content)
    Post.create(post_param)
    redirect_to posts_path
  end

  def destroy
    # @post = Post.find(params[:id])
    # @post.destroy
    #
    # redirect_to '/posts/index'

    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  # def comment_create
  #   @post = Post.find(params[:id])
  #   @post.comment.create(content: params[:comment_content])
  #
  #   redirect_to "/posts/show/#{@post.id}"
  # end


  private
  def post_param
    post_param = params.require(:post).permit(:title, :content)
  end

  def post_find
    @post = Post.find(params[:id])
  end
end
