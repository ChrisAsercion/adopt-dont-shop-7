class ApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
    @search_results = params[:search].present? ? Pet.search(params[:search]) : nil
  end

  def new
  end

  def create
    application = Application.new(application_params)
    if application.save
      application.update(status: "In Progress")
      redirect_to "/applications/#{application.id}"
    else
      flash[:notice] = "Error: #{error_message(application.errors)}"
      redirect_to "/applications/new"
    end
  end

  def edit
    @application = Application.find(params[:id])
  end

  def update
    application = Application.find(params[:id])
    if application.update(application_params)
      redirect_to "/applications/#{application.id}"
    else
      flash[:notice] = "Error: #{error_message(application.errors)}"
      redirect_to "/applications/#{application.id}/edit"
    end
  end

  def search_pets
    @application = Application.find(params[:id])
    @search_results = Pet.search(params[:search])
  end


  private

  def application_params
    params.permit(:name, :address, :description, :status)
  end
end