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
        format.html { redirect_to my_pages_reviews_path, notice: "更新しました" }
      else
        format.html { render :edit, notice: "ダメ" }
      end
    end
  end

  def destroy
    @review = Review.find(params[:id])
    respond_to do |format|
      if @review.destroy 
        format.html { redirect_to my_pages_reviews_path, notice: "できた" }
      else
        format.html { render :index, notice: "だめ" }
      end
    end
  end

  private
  def review_params
    params.require(:review).permit(:comment)
  end
end