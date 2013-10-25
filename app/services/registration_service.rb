require "securerandom"

class RegistrationService
  def initialize(user)
    @user = user
  end

  def save
    @user.api_key = SecureRandom.hex
    @user.save
  end
end
