class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :value
      t.integer :number_id
      t.integer :blast_id
      t.timestamps null: false
    end
  end
end
