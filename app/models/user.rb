class User < ActiveRecord::Base
  has_many :reminder_users
end