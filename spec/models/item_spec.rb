require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @prototype = FactoryBot.build(:prototype)
  end

  describe 'Itemの保存' do

    context "Itemが保存できる場合" do
      it "タイトル、キャッチコピー、コンセプト、画像があればプロトタイプは保存される" do##
        expect(@prototype).to be_valid
      end
    end

    context "Itemが保存できない場合" do
      it "タイトルがないとItemは保存できない" do##
        @prototype.title = nil
        @prototype.valid?
        expect(@prototype.errors.full_messages).to include("Title can't be blank")
      end     
      it "キャッチコピーがないとItemは保存できない" do##
        @prototype.catch_copy = nil
        @prototype.valid?
        expect(@prototype.errors.full_messages).to include("Catch copy can't be blank")
      end     
      it "コンセプトがないとItemは保存できない" do##
        @prototype.concept = nil
        @prototype.valid?
        expect(@prototype.errors.full_messages).to include("Concept can't be blank")
      end
      it "画像がないとItemは保存できない" do##
        @prototype.image = nil
        @prototype.valid?
        expect(@prototype.errors.full_messages).to include("Image can't be blank")
      end
      it "ユーザーが紐付いていないとItemは保存できない" do
        @prototype.user = nil
        @prototype.valid?
        expect(@prototype.errors.full_messages).to include("User must exist")
      end
    end
  end
end
