class PetApplicationsController < ApplicationController
  def new
  end

  def create
    application = Application.find(params[:application_id])
    pet = Pet.find(params[:pet_id])
    PetApplication.create!(application: application, pet: pet)
    redirect_to "/applications/#{application.id}"
  end

  def update
    pet_application = PetApplication.find(params[:id])
    pet_application.update!(pet_application_params)
    application = pet_application.application
    redirect_to "/admin/applications/#{application.id}"
  end

  private

  def pet_application_params
  params.require(:pet_application).permit(:pet_id, :application_id, :pet_status)
  end

end