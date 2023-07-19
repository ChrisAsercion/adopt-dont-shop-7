class Admin::ApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
    @pet_applications = PetApplication.where(application_id: @application.id)
  end

  def update
    
  end
end