class PetApplicationsController < ApplicationController
  def new
  end

  def create
    application_id = params[:application_id]
    pet_id = params[:pet_id]
    
    PetApplication.create(application_id: application_id, pet_id: pet_id)
    redirect_to "/applications/#{application_id}"
  end

end