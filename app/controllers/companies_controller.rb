class CompaniesController < ApplicationController

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to companys_path(current_user)
    else
      @companys = current_user.companys
      render 'devise/registrations/new'
    end
  end

  private

  def company_params
    params.require(:company).permit(:company_id, :name)
  end

end