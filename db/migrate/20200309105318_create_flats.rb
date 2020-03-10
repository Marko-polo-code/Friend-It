class CreateFlats < ActiveRecord::Migration[5.2]
  def change
    create_table :flats do |t|
      t.string :address
      t.boolean :swappable, default: false
      t.integer :price
      t.string :description
      t.string :title
      t.integer :number_of_bedrooms
      t.float :latitude
      t.float :longitude
      t.integer :number_of_guests
      t.integer :number_of_bathrooms
      t.integer :number_of_beds
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
