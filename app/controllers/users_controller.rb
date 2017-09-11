class UsersController < ApplicationController
	
	def create
		 @post = Post.find(params[:post_id])
    @user = @post.users.create(user_params)
    redirect_to post_path(@post)
	end
	private
    def user_params
      params.require(:user).permit(:first_name, :last_name)
    end

end
