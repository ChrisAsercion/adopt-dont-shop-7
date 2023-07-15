class PetApplicationsController < ApplicationController
  def new
  end

  def create
    application_id = params[:application_id]
    pet_id = params[:pet_id]
    # Logic to create a new record in the pet_applications join table based on the provided IDs
    # For example:
    PetApplication.create(application_id: application_id, pet_id: pet_id)
    redirect_to "/applications/#{application_id}"
  end

end