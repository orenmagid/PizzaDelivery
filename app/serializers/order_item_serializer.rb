class OrderItemSerializer < ActiveModel::Serializer
  belongs_to :order
  belongs_to :pizza_type

  attributes :id, :pizza_type_id, :quantity
end
