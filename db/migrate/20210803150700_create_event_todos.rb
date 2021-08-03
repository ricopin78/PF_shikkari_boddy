class CreateEventTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :event_todos do |t|

      t.timestamps
    end
  end
end
