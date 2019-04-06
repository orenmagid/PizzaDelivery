require 'pry'
class Address < ApplicationRecord
  belongs_to :user
  has_many :orders

  validates :full_address, presence: true, allow_blank: false
  validates :user_id, presence: true

  geocoded_by :full_address
  after_validation :geocode, if: ->(obj) { obj.full_address.present? && obj.full_address_changed? }

  def self.too_far_from_chronicle(order_address)
    chronicle_address = Address.find(1)
    distance_from_chronicle =
      chronicle_address.distance_from([order_address.latitude, order_address.longitude])
    return distance_from_chronicle if distance_from_chronicle > 25

    false
  end
end
