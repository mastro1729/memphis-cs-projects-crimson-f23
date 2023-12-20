class ModifyReminders < ActiveRecord::Migration[7.0]
  def change
    remove_column :reminders, :time
    add_column :reminders, :status, :boolean, default: false
  end
end
