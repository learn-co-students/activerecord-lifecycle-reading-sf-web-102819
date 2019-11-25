class PostsController < ApplicationController
	def index
		@posts = Post.all
	end
 
	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
	  @post = Post.new(strong_params)
	  @post.save
	  redirect_to post_path(@post)
    # if @post.save
    #   redirect_to post_path(@post)
    # else
    #   render :new
    # end
	end

	def update
	  @post = Post.find(params[:id])
	  @post.update(strong_params)
	  redirect_to posts_path
	end

	def edit
	  @post = Post.find(params[:id])
	end
	
	private
	def strong_params
		params.require(:post).permit(:title, :description)
	end
end
