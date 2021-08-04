class CreateAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :attachments do |t|
      t.integer :event_id, null: false
      t.string :file_name, null: false
      t.string :file, null: false
      t.timestamps
    end
  end
end
