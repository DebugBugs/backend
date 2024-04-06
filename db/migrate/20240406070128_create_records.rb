class CreateRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :records do |t|
      t.string :time
      t.integer :energy_usage
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
