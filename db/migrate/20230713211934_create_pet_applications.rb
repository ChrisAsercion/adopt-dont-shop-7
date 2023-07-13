class CreatePetApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :pet_applications do |t|

      t.timestamps
      t.references :pet, null: false, foreign_key: true
      t.references :application, null: false, foreign_key: true
    end
  end
end
