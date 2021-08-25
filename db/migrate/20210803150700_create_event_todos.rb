class CreateEventTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :event_todos do |t|
      t.integer :event_id,    null: false
      t.string :title,        null: false
      t.datetime :deadline,   null: false
      t.boolean :completed,   defalt: true
      t.integer :duration
      t.text :body
      t.timestamps
    end
  end
end
