module AuthConcern
  extend ActiveSupport::Concern

  ALERT_INVALID = 'Invalid credentials. Please try again.'
  ALERT_LOGIN = 'Logged in successfully!'
  ALERT_LOGOUT = 'You have been securely logged out.'
  ALERT_DENIED = 'Authorization required.'

  def logged_in_user_id
    session[:current_user_id]
  end

  def logged_in_username
    user = User.find logged_in_user_id
    return nil if user.nil?

    user.username
  end

  def destroy
    session[:current_user_id] = nil
  end

  def authenticate(username)
    session[:current_user_id] = user_id username
  end

  def valid_credentials?(username, password)
    user = User.find_by_username username
    return false if user.nil?

    user.password === password
  end

  private

  def user_id(username)
    User.find_by_username(username).id
  end
end