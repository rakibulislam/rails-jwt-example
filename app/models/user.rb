class User < ActiveRecord::Base
    has_many :badges
    accepts_nested_attributes_for :badges

    after_initialize :set_defaults
    has_secure_password

    def self.find_by_credentials(email, password)
        user = User.find_by_email(email)
        if user.authenticate(password)
            user
        else
            false
        end
    end

    def send_password_reset
      random_string = SecureRandom.hex
      self.password = random_string
      self.password_confirmation = random_string
      if self.save
        UserMailer.send_password_reset(email, random_string)
      end
    end

    private
    def set_defaults
        self[:overall_ranking] = 0.0
    end
end
