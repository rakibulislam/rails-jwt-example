class Box < ActiveRecord::Base
  belongs_to :user

  geocoded_by :full_street_address
  after_validation :geocode, if: :location_changed?

  private

  def full_street_address
    if unit.present?
      address + " " + unit + " " + city + " " + state + " " + zip
    else
      binding.pry
      address + " " + city + " " + state + " " + zip
    end
  end

  def location_changed?
    address_changed? || unit_changed? || city_changed? || state_changed? || zip_changed?
  end
end
