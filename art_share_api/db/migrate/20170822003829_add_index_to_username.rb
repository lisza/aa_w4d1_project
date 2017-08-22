class AddIndexToUsername < ActiveRecord::Migration[5.1]
  def change
  end

  add_index :users, :username, unique: true
end
