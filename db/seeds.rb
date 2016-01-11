# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Reminder.create([{text: 'Clean the house.', date: '2014-09-15 12:55:32'},
                 {text: 'Do the dishes.', date: '2014-09-18 11:50:15'}])

ReminderNotification.create(reminder_id: 2)

ReminderUser.create([{reminder_id: 1, user_id: 2},
                     {reminder_id: 2, user_id: 1}])

User.create([{username: 'qmcree', password: 'hello', sms_email: '6019885590@sms.att.net'},
             {username: 'jrodgers', password: 'test', sms_email: '5125883394@voice.google.com'}])