class AuthController < ApplicationController
  include AuthConcern
  skip_before_action :auth_filter, only: [:show_login, :login]
  layout 'application'

  def show_login
    if logged_in_user_id
      redirect_to action: 'index', controller: 'reminders'
    end
  end

  def login
    unless valid_credentials? params[:username], params[:password]
      flash[:error] = ALERT_INVALID
      redirect_to action: 'show_login'
      return
    end

    authenticate params[:username]
    flash[:success] = ALERT_LOGIN
    redirect_to action: 'index', controller: 'reminders'
  end

  def logout
    destroy
    flash[:success] = ALERT_LOGOUT
    redirect_to action: 'show_login'
  end
end