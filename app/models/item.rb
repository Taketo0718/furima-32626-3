class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_prefecture
  belongs_to :item_sales_status
  belongs_to :item_scheduled_delivery
  belongs_to :item_shipping_fee_status

  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_info
  end

  with_options numericality: { other_than: 1, message: 'Select' }  do
    validates :item_category_id
    validates :item_sales_status_id
    validates :item_shipping_fee_status_id
    validates :item_prefecture_id
    validates :item_scheduled_delivery_id
  end

  validates :item_price, presence: true,
    numericality:{ only_integer: true,
                   message: 'Half-width number'}

  validates :item_price,
    numericality:{ greater_than_or_equal_to: 300,
                  less_than_or_equal_to: 9999999,
                  message:'Out of setting range'}

  belongs_to :user
  has_one_attached :image
end
