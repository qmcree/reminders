class ReminderUser < ActiveRecord::Base
  belongs_to :reminder
  belongs_to :user
end
