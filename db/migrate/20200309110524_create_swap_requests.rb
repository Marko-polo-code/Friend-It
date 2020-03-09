class CreateSwapRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :swap_requests do |t|
      t.date :start_date
      t.date :end_date
      t.string :status
      t.references :requester_flat, foreign_key: {to_table: :flats}
      t.references :requested_flat, foreign_key: {to_table: :flats}
      
      t.timestamps
    end
  end
end
