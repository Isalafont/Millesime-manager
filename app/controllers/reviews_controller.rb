class ReviewsController < ApplicationController

  def index
    @reviews = policy_scope(Review).where(user: current_user).where(liked: nil)
  end

  def update
    @review = Review.find(review_params[:id])
    authorize @review
    @review.update(review_params)
    redirect_to reviews_path
  end

  private

  def review_params
    params.require(:review).permit(:liked, :comment, :id)
  end

end