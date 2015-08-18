class AddNumberToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :number, :string
  end
end
