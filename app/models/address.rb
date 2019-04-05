class Address < ApplicationRecord
  belongs_to :user
  has_many :orders
  geocoded_by :full_address
  after_validation :geocode

  def self.too_far_from_chronicle(order_address)
    chronicle_address = Address.find(1)
    distance_from_chronicle =
      order_address.distance_from([order_address.latitude, order_address.longitude])
    return true if distance_from_chronicle > 25

    false
  end
end
