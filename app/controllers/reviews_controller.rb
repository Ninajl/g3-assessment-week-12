class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to reviews_path, notice: "Thanks for your review!"
    else
      render :new
    end
  end

  private
  def review_params
    params.require(:review).permit(:movie_id, :user_id, :title, :body)
  end

end
