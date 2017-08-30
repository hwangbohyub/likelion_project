class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :is_owner?, only: [:edit, :update, :destroy]

  #Crate
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = '성공적으로 글을 작성하였습니다!'
      # redirect_to post_path(@post)
      redirect_to @post
    else
      flash[:danger] = '글을 작성하지 못했습니다ㅠㅠ'
      render :new
    end
  end
  #Read
  def index
    @posts = Post.order(created_at: :DESC).page(params[:page]).per(10)
  end

  def show
    @comment = Comment.new
    @comments = @post.comments
  end
  #Update
  def edit
  end

  def update
    if @post.update(post_params)
      flash[:notice] = '성공적으로 글을 수정하였습니다!'
      redirect_to @post
    else
      flash[:danger] = '글을 수정하지 못했습니다ㅠㅠ'
      render :edit
    end
  end
  #Delete
  def destroy
    @post.destroy!

    redirect_to posts_path
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end

  def is_owner?
    unless current_user == @post.user
      redirect_to root_path
    end
  end
end
