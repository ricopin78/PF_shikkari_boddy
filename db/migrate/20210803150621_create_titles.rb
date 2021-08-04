class CreateTitles < ActiveRecord::Migration[5.2]
  def change
    create_table :titles do |t|
      t.integer :user_id, null: false
      t.string :department, null: false
      t.string :position
      t.timestamps
    end
  end
end
