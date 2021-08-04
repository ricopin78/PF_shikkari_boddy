class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :user_id, null: false
      t.datetime :start_time, null: false
      t.datetime :finish_time, null: false
      t.string :title, null: false
      t.text :overview
      t.timestamps
    end
  end
end
