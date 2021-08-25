class CreateRelevantParties < ActiveRecord::Migration[5.2]
  def change
    create_table :relevant_parties do |t|
      t.integer :user_id,     null: false
      t.integer :event_id,    null: false
      t.integer :attendance,  null:false, defalt: 0
      t.timestamps
    end
  end
end
