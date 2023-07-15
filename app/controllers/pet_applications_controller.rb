class PetApplicationsController < ApplicationController
  def new
  end

  def create
    binding.pry
    @pet_application = PetApplication.new(pet_application_params)
    @pet_application.save
    redirect_to "/applications/#{@application.id}"  
  end

  private

  def pet_application_params
    binding.pry
    params.require(:pet_id)
  end
end