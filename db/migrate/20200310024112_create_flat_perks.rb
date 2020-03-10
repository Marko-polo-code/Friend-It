class CreateFlatPerks < ActiveRecord::Migration[5.2]
  def change
    create_table :flat_perks do |t|
      t.references :perk, foreign_key: true
      t.references :flat, foreign_key: true

      t.timestamps
    end
  end
end
