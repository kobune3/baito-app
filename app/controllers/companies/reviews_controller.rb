class Companies::ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.company = Company.find(params[:company_id])
    if @review.save
      redirect_to company_path(@review.company_id)
    end
  end

  private
  def review_params
    params.require(:review).permit(:comment)
  end
end
