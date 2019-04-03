class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    respond_to do |format|
      if @company.save
        format.html { redirect_to "/" }
      end
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update; end
  def destroy; end
    
  def show
    @company = Company.find(params[:id])
  end
    
  private
  def company_params
    params.require(:company).permit(:name)
  end
end