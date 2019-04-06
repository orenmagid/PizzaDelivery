class Order < ApplicationRecord
  has_many :order_items
  has_many :pizza_types, through: :order_items
  belongs_to :user
  belongs_to :address

  accepts_nested_attributes_for :order_items

  def calculate_tax_and_total
    order_items = self.order_items
    total = order_items.reduce(0) { |sum, num| sum + num.pizza_type.price }

    if total > 75
      self.discount = 0.10
      total = (total * 1 - discount).round(2)
    else if total > 50
           self.discount = 0.05
           total = (total * 1 - discount).round(2)
    end

  end

    self.tax = (total * 0.06).round(2)
    self.total = tax + total
  end
end
