class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.text :body
      t.datetime :deadline, null: false
      t.integer :duration
      t.integer :priority, null: false
      t.boolean :completed, defalt: true
      t.timestamps
    end
  end
end