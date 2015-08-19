class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :conversation_id
      t.integer :contact_id
      t.string :body

      t.timestamps null: false
    end
  end
end
