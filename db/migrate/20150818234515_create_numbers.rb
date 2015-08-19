class CreateNumbers < ActiveRecord::Migration
  def change
    create_table :numbers do |t|
    	t.references :ownable, polymorphic: true, index: true
    	t.string :number
      t.timestamps null: false
    end
  end
end
