class OrganizationsController < ApplicationController
	before_action :authenticate_user!, only: [:new] 

	def new
		@organization = current_user.organizations.new
	end

	def create
    @organization = current_user.organizations.new(organization_params)
    if @organization.save
      redirect_to root_path, success: 'Organization was successfully created.'
    else
      flash[:error] = 'There was a problem creating this organization.'
      render :new
    end
  end

  private

   def organization_params
    params.require(:organization).permit(:name)
  end
end