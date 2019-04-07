class UserSerializer < ActiveModel::Serializer
  has_many :orders
  has_many :addresses

  attributes :id, :first_name, :last_name, :username, :email, :addresses
end
