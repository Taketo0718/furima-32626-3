require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'Itemの保存' do

    context "Itemが保存できる場合" do
      it "画像、商品名、商品説明、商品の詳細、配送について、販売価格があればitemは保存される" do
        expect(@item).to be_valid
      end
    end

    context "Itemが保存できない場合" do
      it "商品名がないとItemは保存できない" do
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end     
      it "商品説明がないとItemは保存できない" do
        @item.item_info = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item info can't be blank")
      end     
      it "カテゴリーがないとItemは保存できない" do
        @item.item_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category Select")
      end
      it "商品の状態がないとItemは保存できない" do
        @item.item_sales_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item sales status Select")
      end
      it "配送料の負担がないとItemは保存できない" do
        @item.item_shipping_fee_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item shipping fee status Select")
      end
      it "発送元の地域がないとItemは保存できない" do
        @item.item_prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item prefecture Select")
      end
      it "発送までの日数がないとItemは保存できない" do
        @item.item_scheduled_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item scheduled delivery Select")
      end
      it "販売価格がないとItemは保存できない" do
        @item.item_price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end
      it "販売価格が300円以上でないとItemは保存できない" do
        @item.item_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price Out of setting range")
      end
      it "販売価格が999,999円以下でないとItemは保存できない" do
        @item.item_price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price Out of setting range")
      end
      it "販売価格が半角数字でなければItemは保存できない" do
        @item.item_price = '３３３'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price Half-width number")
      end
      it "ユーザーが紐付いていないとItemは保存できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
