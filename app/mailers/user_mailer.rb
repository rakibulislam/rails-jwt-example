class UserMailer < BaseMandrillMailer

  require 'securerandom'

  def send_password_reset(user_email, new_password)

    subject = "Password Reset"

    # body = mandrill_template("welcome", merge_vars) TO USE MANDRILL TEMPLATE

    send_mail(user_email, subject, new_password)
  end
end
