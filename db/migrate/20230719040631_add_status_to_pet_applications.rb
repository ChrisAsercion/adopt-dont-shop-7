class AddStatusToPetApplications < ActiveRecord::Migration[7.0]
  def change
    add_column :pet_applications, :pet_status, :string, default: "Pending"
  end
end
