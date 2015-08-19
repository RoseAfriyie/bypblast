class AddEventIdToBlast < ActiveRecord::Migration
  def change
    add_column :blasts, :event_id, :string
  end
end
