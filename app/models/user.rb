class User < ActiveRecord::Base
    has_many :movements
    accepts_nested_attributes_for :movements

    def self.find_by_credentials(email, name)
        User.where(email: email, name: name).first
    end
end
