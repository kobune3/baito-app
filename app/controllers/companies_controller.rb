class CompaniesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]

  def index
    @q = Company.ransack(params[:q])
    @companies = @q.result(distinct: true)
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    respond_to do |format|
      if @company.save
        format.html { redirect_to root_path }
      end
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update; end
  def destroy; end

  private
  def company_params
    params.require(:company).permit(:name, :image)
  end
end