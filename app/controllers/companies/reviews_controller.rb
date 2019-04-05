class Companies::ReviewsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reviews = Review.page(params[:page]).per(2).order("created_at DESC")
  end

  def new
    @company = Company.find(params[:company_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.company = Company.find(params[:company_id])
    if @review.save
      redirect_to company_path(@review.company_id)
    end
  end

  def edit
    @company = Company.find(params[:company_id])
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to "/users/#{current_user.id}" }
      end
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to "/users/#{current_user.id}"
  end

  private
  def review_params
    params.require(:review).permit(:comment)
  end
end
