class ReviewsController < ApplicationController
  def index
    @reviews=Review.page(params[:page]).per(2).order("created_at DESC")
  end
  
  def new
    @review=Review.new
  end
  
  def create
    Review.create(firm: review_params[:firm], review: review_params[:review])
    redirect_to "/"
  end
  
  def edit
    @review=Review.find(params[:id])
  end
  
  def update
    review=Review.find(params[:id])
    review.update(review_params)
    redirect_to "/"
  end
  
  private
  def review_params
    params.permit(:firm, :review)
  end
end
