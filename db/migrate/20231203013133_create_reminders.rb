class CreateReminders < ActiveRecord::Migration[7.0]
  def change
    create_table :reminders do |t|
      t.string :title
      t.string :description
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
