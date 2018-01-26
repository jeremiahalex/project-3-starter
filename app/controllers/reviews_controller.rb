class ReviewsController < ApplicationController
  def create
    @new_review = Review.new
    @new_review.title = params[:review][:title]
    @new_review.review = params[:review][:review]
    @new_review.space_id = params[:space_id]
    @new_review.user_id = 1
    @new_review.save
    # render json: params

    respond_to do |format|
      format.js
    end
  end

  def destroy
    #code
  end
end
