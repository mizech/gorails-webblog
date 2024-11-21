class BlogPostsController < ApplicationController
  before_action :find_blog_post, only: [:show, :edit, :destroy, :update]
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @blogPosts = BlogPost.all
  end

  def show
  end

  def new
    @blog_post = BlogPost.new
  end

  def create
    @blog_post = BlogPost.new(blog_posts_params())

    if @blog_post.save
      redirect_to @blog_post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def destroy
    @blog_post.destroy
    redirect_to root_path
  end

  def update
    if @blog_post.update(blog_posts_params)
      redirect_to @blog_post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def blog_posts_params
    params.require(:blog_post).permit(:title, :body)
  end

  def find_blog_post
    @blog_post = BlogPost.find(params[:id])
  rescue
    redirect_to root_path
  end
end
