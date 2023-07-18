class PetApplicationsController < ApplicationController
  def new
  end

  def create
    application = Application.find(params[:application_id])
    pet = Pet.find(params[:pet_id])
    PetApplication.create!(pet_id: pet.id, application_id: application.id )
    application.pets << pet #this should be created in a table (look for AR)
    redirect_to "/applications/#{application.id}"
  end

end