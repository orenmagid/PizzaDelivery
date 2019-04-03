class OrderSerializer < ActiveModel::Serializer
  belongs_to :user
  has_many :order_items
  has_many :pizza_types, through: :order_items

  attributes id:, :user_id, :date_time, :order_item, :address
end
