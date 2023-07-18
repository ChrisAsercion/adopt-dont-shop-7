class Admin::SheltersController < ApplicationController
  def index
    @shelters = Shelter.find_by_sql("SELECT * FROM shelters ORDER BY name DESC")
    @pending_shelters = Shelter.select(:status, "Pending" )
  end
end
