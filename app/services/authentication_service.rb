class AuthenticationService
  def self.authenticate_from_session(session)
    user = User.find_by(username: session.username)
    user.authenticate(session.password) if user
  end

  def self.authenticate_from_headers(header_value)
    username, api_key = header_value.to_s.split(":")
    user = User.find_by(username: username)
    user.api_key == api_key && user if user
  end
end
