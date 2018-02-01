class ReviewsController < ApplicationController
  def create
    @new_review = Review.new
    @new_review.title = params[:review][:title]
    @new_review.review = params[:review][:review]
    @new_review.space_id = params[:space_id]
    if current_user
      @new_review.user_id = current_user.id
    else
      @new_review.user_id = 0
    end
    @new_review.save
    # render json: @new_review

    respond_to do |format|
      format.js
    end
  end

  def destroy
    #code
  end
end
