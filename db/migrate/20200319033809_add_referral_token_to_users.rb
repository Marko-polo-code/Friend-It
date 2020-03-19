class AddReferralTokenToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :referral_token, :string, limit: 8
    add_index :users, :referral_token, unique: true
  end
end
