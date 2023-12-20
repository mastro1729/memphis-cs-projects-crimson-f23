class AddCustomerToReminders < ActiveRecord::Migration[7.0]
  def change
    add_reference :reminders, :customer, foreign_key: true
  end
end
