class CreateReminderUsers < ActiveRecord::Migration
  def change
    create_table :reminder_users do |t|
      t.belongs_to :reminder
      t.belongs_to :user
    end
  end
end
