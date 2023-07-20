class Admin::ApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
    @pending_pets = @application.pending_pets
    @rejected_pets = @application.rejected_pets
    @approved_pets = @application.approved_pets

    # @pets = @application.pets
  end
end