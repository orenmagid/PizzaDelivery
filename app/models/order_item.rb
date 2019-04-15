class OrderItem < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :pizza_type, optional: true

  validates_presence_of :pizza_type
  validate :quantity_greater_than_zero_and_less_than_twenty

  scope :recent, -> { order(created_at: :desc) }

  private

  def quantity_greater_than_zero_and_less_than_twenty
    if quantity <= 0
      errors.add(:quantity, 'must be greater than zero')
    elsif quantity > 20
      errors.add(:quantity, 'must be less than twenty')
    end
  end
end
