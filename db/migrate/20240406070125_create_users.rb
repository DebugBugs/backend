class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.integer :health
      t.string :status
      t.integer :currency
      t.boolean :aircon
      t.boolean :laundry
      t.boolean :fridge
      t.string :others
      t.timestamps
    end
  end
end
