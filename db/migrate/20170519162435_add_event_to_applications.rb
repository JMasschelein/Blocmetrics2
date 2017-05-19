class AddEventToApplications < ActiveRecord::Migration[5.0]
  def change
    add_column :applications, :event_id, :integer
    add_index :applications, :event_id
  end
end
