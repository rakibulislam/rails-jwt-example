class Box < ActiveRecord::Base
  belongs_to :user
  has_many :business_hours
  accepts_nested_attributes_for :business_hours
end
