class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.hstore :details, default: {}, null: false

      t.timestamps null: false
    end
  end
end
