class CreateBlasts < ActiveRecord::Migration
  def change
    create_table :blasts do |t|
      t.text :content
      t.references :ownable, polymorphic: true, index: true
      t.timestamps null: false
    end
  end
end
