class Order < ApplicationRecord
  has_many :order_items
  has_many :pizza_types, through: :order_items
  belongs_to :user
end
