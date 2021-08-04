class CreateRelevantParties < ActiveRecord::Migration[5.2]
  def change
    create_table :relevant_parties do |t|
      t.integer :user_id, null: false
      t.integer :event_id, null: false
      t.boolean :attendance
      t.timestamps
    end
  end
end
