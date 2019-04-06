class MyPages::ReviewsController < ApplicationController
  
  def index
    @user = current_user
  end
  
  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to my_pages_reviews_path }
      end
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy if current_user.id == @review.user_id
    redirect_to my_pages_reviews_path
  end

  private
  def review_params
    params.require(:review).permit(:comment)
  end
end