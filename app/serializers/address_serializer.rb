class AddressSerializer < ActiveModel::Serializer
  belongs_to :user
  has_many :orders
  attributes :id, :location, :latitude, :longitude, :user_id
end
