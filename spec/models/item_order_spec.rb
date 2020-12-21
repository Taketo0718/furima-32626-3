require 'rails_helper'

describe ItemOrder do
  before do
    @item_order = FactoryBot.build(:item_order)
  end

  describe 'ユーザー新規登録' do
    context '購入がうまくいくとき' do
      it "郵便番号と都道府県、市区町村、番地、ビル名、電話番号、item_id、user_id、tokenが存在すれば購入できる" do
        expect(@item_order).to be_valid
      end
      it "建物が空でも購入できる" do
        @item_order.building = nil
        expect(@item_order).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it "トークンがないと購入できない" do
        @item_order.token = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Token can't be blank")
      end
      it "郵便番号に-がないと購入できない" do
        @item_order.postal_code = "0123456"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal code Input correctly")
      end
      it "郵便番号が空白だと購入できない" do
        @item_order.postal_code = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal code can't be blank")
      end
      it "都道府県が空では購入できない" do
        @item_order.prefecture_id = 1
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Prefecture Select")      
      end
      it "市区町村が空では購入できない" do
        @item_order.city = ""
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("City can't be blank")
      end
      it "番地が空では購入できない" do
        @item_order.addresses = ""
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Addresses can't be blank")
      end
      it "電話番号が空では購入できない" do
        @item_order.phone_number = ""
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone number can't be blank")
      end
      it "電話番号が数字以外を含むと購入できない" do
        @item_order.phone_number= "#{@item_order.phone_number}a"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone number Input only number")
      end
      it "電話番号が12桁以上だとを購入できない" do
        @item_order.phone_number= "012345678901"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
    end
  end
end