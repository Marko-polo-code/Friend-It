class CreateRecommendations < ActiveRecord::Migration[5.2]
  def change
    create_table :recommendations do |t|
      t.string :name
      t.string :address
      t.string :description
      t.float :latitude
      t.float :longitude
      t.references :flat, foreign_key: true

      t.timestamps
    end
  end
end
