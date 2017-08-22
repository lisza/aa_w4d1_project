class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|

      t.string :name, NULL: false
      t.string :email, NULL: false

      t.timestamps
    end
  end
end
