class BlogPostsController < ApplicationController
  def index
    @blogPosts = BlogPost.all
  end

  def show
    @blogPost = BlogPost.find(params[:id])
  rescue
    redirect_to root_path
  end
end
