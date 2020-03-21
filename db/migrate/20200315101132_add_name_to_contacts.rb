class AddNameToContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :name, :string
  end
end
