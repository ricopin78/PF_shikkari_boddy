class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :user, foreign_key: true
      t.datetime :start_time, null: false
      t.datetime :finish_time, null: false
      t.string :title, null: false
      t.text :overview
      t.timestamps
    end
  end
end
