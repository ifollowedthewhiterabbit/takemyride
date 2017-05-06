class VehicleListing < ApplicationRecord
  belongs_to :car_model
  belongs_to :owner, class_name: 'User'

  has_many :bookings, dependent: :destroy
  has_many :pictures, dependent: :destroy
  accepts_nested_attributes_for :pictures

  def full_address
    [self.address, self.city, self.state].join(', ')
  end

  def country
    ISO3166::Country.new(self.country_code)
  end
end