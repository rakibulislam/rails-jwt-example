class Api::V1::ResetPasswordService

  def self.reset_password(user)
    random_string = SecureRandom.hex
    user.update(password: random_string)
    UserMailer.send_password_reset(user.email, random_string).deliver_now
  end

end
