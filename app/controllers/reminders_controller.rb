class RemindersController < ApplicationController
  include AuthConcern
  layout 'application'

  def index
    @reminders = Reminder.joins(:user).where(users: { id: logged_in_user_id })
    @username = logged_in_username
  end

  def show_create
  end

  def create
    Reminder.create({text: params[:text], date: params[:date]}, logged_in_user_id)

    redirect_to action: 'index'
  end
end