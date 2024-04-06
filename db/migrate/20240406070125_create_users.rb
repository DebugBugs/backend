class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.integer :health
      t.string :level
      t.integer :currency
      t.timestamps
    end
  end
end
