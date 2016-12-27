class AddIndexToUsers < ActiveRecord::Migration[5.0]
  def change
  end
  add_index :users, :uid
  add_index :users, :provider
  add_index :users, [:uid, :provider], unique: true
end
