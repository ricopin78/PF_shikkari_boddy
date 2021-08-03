class CreateRelevantParties < ActiveRecord::Migration[5.2]
  def change
    create_table :relevant_parties do |t|

      t.timestamps
    end
  end
end
