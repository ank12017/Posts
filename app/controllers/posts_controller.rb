class PostsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]

	def index
	  @posts = Post.all
	  respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts.map{|post| post.to_jq_post } }
    end
	end

	def show 

      @post = Post.find(params[:id])
     # redirect_to users_path (current_user)
       respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
	end
	
	def new
	  @post = Post.new
	  respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
	end

	def edit
         @post = Post.find(params[:id])
	end
	
	def create
     @post = Post.new(post_params)
	    # if @post.save
	    #     redirect_to @post
	    # else
	    # 	render 'new'
	    # end
	    respond_to do |format|
      if @post.save
        format.html {
          render :json => [@post.to_jq_post].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json { render json: {files: [@post.to_jq_post]}, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
      end
	end

    def update
      @post = Post.find(params[:id])
    #       if @post.update(post_params)
		  #   redirect_to @post
		  # else
		  #   render 'edit'
		  # end
		   respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Upload was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
      end
    end

    def destroy
	  @post = Post.find(params[:id])
	  @post.destroy
	
	  # redirect_to posts_path

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
    end
   

	private
     def post_params
      params.require(:post).permit(:title, :text, :user_id, :avatar,:avatar_file_name, :avatar_content_type, :avatar_file_size, :avatar_updated_at)
    end

end
