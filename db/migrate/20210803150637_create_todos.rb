class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.integer :user_id,       null: false
      t.string :title,          null: false
      t.datetime :deadline,     null: false
      t.boolean :completed,     defalt: true
      t.integer :priority,      null: false, default: 0
      t.integer :duration,      null: false
      t.text :body
      t.timestamps
    end
  end
end