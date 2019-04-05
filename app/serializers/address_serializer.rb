class AddressSerializer < ActiveModel::Serializer
  belongs_to :user
  has_many :orders
  attributes :id, :full_address, :latitude, :longitude, :user_id
end
