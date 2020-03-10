class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.integer :phone_number
      t.string :address
      t.string :description
      t.references :flat, foreign_key: true

      t.timestamps
    end
  end
end
