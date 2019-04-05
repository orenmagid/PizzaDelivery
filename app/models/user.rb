class User < ApplicationRecord
  has_many :orders
  has_many :addresses

  has_secure_password

  validates_presence_of :first_name, :last_name, :username, :email, :password_digest
end
