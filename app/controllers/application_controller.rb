class ApplicationController < ActionController::Base
  include AuthConcern
  before_action :auth_filter

  private

  def auth_filter
    unless logged_in_user_id
      flash[:info] = ALERT_DENIED
      redirect_to action: 'show_login', controller: 'auth'
    end
  end
end
