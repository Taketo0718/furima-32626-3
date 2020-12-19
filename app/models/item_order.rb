class ItemOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Input correctly"}
    validates :city
    validates :addresses
    validates :phone_number, numericality: { only_integer: true, message: "Input only number" }
    validates :item_id
    validates :user_id
  end

    validates :prefecture_id, numericality: { other_than: 1, message: "Select" }
    
  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city,
                   addresses: addresses, building: building, phone_number: phone_number, order_id: order.id)
  end
end