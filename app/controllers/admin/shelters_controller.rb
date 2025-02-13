class Admin::SheltersController < ApplicationController
  def index
    @shelters = Shelter.find_by_sql("SELECT * FROM shelters ORDER BY name DESC")
    @has_pending = Shelter.joins(pets: :applications).where(applications: { status: "Pending" }).distinct
  end
end
