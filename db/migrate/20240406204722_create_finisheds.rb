class CreateFinisheds < ActiveRecord::Migration[7.1]
  def change
    create_table :finisheds do |t|
      t.string :goal
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
