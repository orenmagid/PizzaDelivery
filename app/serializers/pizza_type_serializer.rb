class PizzaTypeSerializer < ActiveModel::Serializer
  has_many :order_items
  has_many :orders, through: :order_items

  attributes :id, :name, :price
end
