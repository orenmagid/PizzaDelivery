class PizzaType < ApplicationRecord
  has_many :order_items
  has_many :orders, through: :order_items

  validates_presence_of :name, :price
  validate :price_greater_than_zero_and_less_than_twenty

  def price_greater_than_zero_and_less_than_twenty
    if price <= 0
      errors.add(:price, 'must be greater than zero')
    elsif price > 20
      errors.add(:price, 'must be less than twenty. Remember our target audience!')
    end
  end
end
