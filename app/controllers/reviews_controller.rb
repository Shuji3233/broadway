class ReviewsController < ApplicationController

  def new
		@play = Play.find(params[:play_id])
		@review = Review.new
	end
	
	def create
		@play = Play.find(params[:play_id])
		@review = Review.new(params.require(:review).permit(:rating, :comment))
		@review.play_id = @play.id
		@review.user_id = current_user.id

		if @review.save
			redirect_to play_path
		else
			render "new"
		end
	end
	

end
