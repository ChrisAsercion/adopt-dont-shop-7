class Admin::SheltersController < ApplicationController
  def index
    @shelters = Shelter.order_by_name_desc
    @has_pending = Shelter.has_pending_pet_applications
  end
end
