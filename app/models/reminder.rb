class Reminder < ActiveRecord::Base
  has_many :reminder_notifications
  has_one :reminder_user
  has_one :user, through: :reminder_user

  def self.create(params, user_id = nil)
    reminder = super(params)

    ReminderUser.create(reminder_id: reminder.id, user_id: user_id) if user_id
  end
end
