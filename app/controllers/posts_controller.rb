class PostsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
	def index
	  @posts = Post.all
	end
	def show 

      @post = Post.find(params[:id])
     # redirect_to users_path (current_user)
      
	end
	
	def new
	  @post = Post.new
	end
	def edit
         @post = Post.find(params[:id])
	end
	
	def create
     @post = Post.new(post_params)
	    if @post.save
	        redirect_to @post
	    else
	    	render 'new'
	    end
	end
    def update
      @post = Post.find(params[:id])
          if @post.update(post_params)
		    redirect_to @post
		  else
		    render 'edit'
		  end
    end
    def destroy
	  @post = Post.find(params[:id])
	  @post.destroy
	
	  redirect_to posts_path
    end

	private
     def post_params
      params.require(:post).permit(:title, :text, :user_id, :avatar)
    end

end
