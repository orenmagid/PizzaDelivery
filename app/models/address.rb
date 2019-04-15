require 'pry'
class Address < ApplicationRecord
  belongs_to :user
  has_many :orders

  validates :location, presence: true
  validates :user_id, presence: true
  validate :within_range_of_chronicle, if: -> { location != '1255 23rd St NW, Washington, DC 20037' && location != '' }

  geocoded_by :location
  after_validation :geocode, if: ->(obj) { obj.location.present? && obj.location_changed? }

  scope :recent, ->(num) { order('created_at DESC').limit(num) }

  private

  def within_range_of_chronicle
    chronicle_address = Address.find(1)

    # If the geocoder fails to find coorindates, this fails

    results = Geocoder.search(location).first

    if results.nil?

      errors.add(:base, 'This address cannot be geocoded. Please try again.')

    else

      coordinates = results.coordinates

      distance_from_chronicle =
        chronicle_address.distance_from([coordinates[0], coordinates[1]])

      error = "You are #{distance_from_chronicle} miles from the Chronicle. We are located at 1255 23rd St NW # 700, Washington, DC 20037. Let us know when you are a bit closer, and we would be happy to deliver."

      errors.add(:base, error) if distance_from_chronicle > 25
    end
  end
end
