class User < ActiveRecord::Base
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :phone, presence: true

    has_many :badges
    accepts_nested_attributes_for :badges

    has_secure_password

    after_create :initialize_badges
    before_save :downcase_email

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
      if self.save
        UserMailer.send_password_reset(email, random_string)
      end
    end

    private

    def initialize_badges
      movements = [["Fran Time","Do you even WOD, bro?"],
                   ["500m Row Time", "Endurance"],
                   ["Back Squat 1RM", "Strength"],
                   ["Clean and Jerk 1RM", "Olympic"],
                   ["Unbroken Pull Ups", "Gymnastic"]]
      movements.each do |m|
        new_badge = {
          name: m[0],
          description: m[1],
          ranking: "Unranked",
          value: 0,
          user_id: self.id
        }
        Badge.create(new_badge)
      end
    end

    def downcase_email
      self.email = self.email.downcase
    end
end
