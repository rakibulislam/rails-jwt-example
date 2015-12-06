class User < ActiveRecord::Base
    has_many :movements
    accepts_nested_attributes_for :movements

end
