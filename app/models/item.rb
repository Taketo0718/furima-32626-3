class Item < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_info
    validates :item_category
    validates :item_sales_status
    validates :item_shipping_fee_status
    validates :item_prefecture
    validates :item_scheduled_delivery
    validates :item_price
  end
  belongs_to :user
  has_one_attached :image
end
