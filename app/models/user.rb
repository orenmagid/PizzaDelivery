class User < ApplicationRecord
  has_many :orders
  has_many :addresses

  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { in: 6..20 }, if: proc { |obj| !obj.password.blank? }

  validates_presence_of :first_name, :last_name, :email
end
