class ChangePriceOnFlats < ActiveRecord::Migration[5.2]
  def change
    remove_column :flats, :price
    add_monetize :flats, :price, currency: { present: false }
  end
end
