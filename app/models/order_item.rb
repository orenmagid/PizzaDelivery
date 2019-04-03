class OrderItem < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :pizza_type, optional: true
end
