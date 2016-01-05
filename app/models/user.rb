class User < ActiveRecord::Base
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :phone, presence: true
    validates :gender, presence: true

    has_many :badges, dependent: :destroy
    has_many :boxes
    accepts_nested_attributes_for :badges

    has_secure_password

    after_create :initialize_badges
    before_save :downcase_fields

    def self.find_by_credentials(email, password)
        user = User.find_by_email(email.downcase!)
        if user.authenticate(password)
            user
        else
            false
        end
    end

    def send_password_reset
      Api::V1::ResetPasswordService.reset_password(self)
    end

    def calc_overall_ranking
      sum = 0.0
      self.badges.each do |badge|
        if badge[:ranking_value] != nil
          sum += badge[:ranking_value]
        end
      end
      avg = sum / self.badges.count
      if avg < 1
        self.update(overall_ranking_value: avg, overall_ranking: "Beginner")
      elsif (avg < 2) && (avg >= 1)
        self.update(overall_ranking_value: avg, overall_ranking: "Intermediate")
      elsif (avg < 3) && (avg >= 2)
        self.update(overall_ranking_value: avg, overall_ranking: "RX")
      elsif (avg >= 3)
        self.update(overall_ranking_value: avg, overall_ranking: "Elite")
      end
    end

    private

    def initialize_badges
      if self.is_crossfitter
        movements = [["Fran Time","Do you even WOD, bro?"],
                     ["500m Row Time", "Endurance"],
                     ["Back Squat 1RM", "Strength"],
                     ["Clean and Jerk 1RM", "Olympic"],
                     ["Unbroken Pull Ups", "Gymnastic"]]
        movements.each do |m|
          new_badge = {
            name: m[0],
            description: m[1],
            ranking: "Beginner",
            ranking_value: 0,
            user_id: self.id
          }
          Badge.create(new_badge)
        end
        self.calc_overall_ranking
      end
    end

    def downcase_fields
      self[:email] = self[:email].downcase
      self[:first_name] = self[:first_name].downcase
      self[:last_name] = self[:last_name].downcase
    end
end
