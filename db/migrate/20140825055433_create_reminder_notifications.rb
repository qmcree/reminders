class CreateReminderNotifications < ActiveRecord::Migration
  def change
    create_table :reminder_notifications do |t|
      t.belongs_to :reminder
      t.timestamps
    end
  end
end
