class CreateApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :applications do |t|
      t.string :name
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip
      t.string :description
      t.string :petscription
      t.string :status

      t.timestamps
    end
  end
end
