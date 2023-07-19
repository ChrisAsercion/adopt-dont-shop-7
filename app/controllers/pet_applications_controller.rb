class PetApplicationsController < ApplicationController
  def new
  end

  def create
    application = Application.find(params[:application_id])
    pet = Pet.find(params[:pet_id])
    PetApplication.create!(application: application, pet: pet)
    redirect_to "/applications/#{application.id}"
  end

end