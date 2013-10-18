class AuthenticationService
  def initialize(session)
    @session = session
  end

  def authenticate!
    user = User.find_by(username: @session.username)
    user.try(:authenticate, @session.password)
  end
end
