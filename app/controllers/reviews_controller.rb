class ReviewsController < ApplicationController

def new
	@review = Review.new
end
def create
	@review = Review.new(review_params)
	@review.post_id = @review.id
	@review.user_id = current_user.id
	if @review.save
		redirect_to book_path(@post)
	else
		render 'new'
	end
end
private
def review_params
	params.require(:reviews).permit(:rating, :comment)
	end
	def find_post
		@post = Post.find(params[:post_id])
	end
end
