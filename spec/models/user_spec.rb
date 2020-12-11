require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいかないとき' do
      it "nicknameが空では登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailが@なしでは登録できない" do
        @user.email = @user.email.gsub("@","")
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")      
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "ab123"
        @user.password_confirmation = "ab123"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが半角英字だけであれば登録できない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")      
      end
      it "last_nameが空だと登録できない" do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "last_nameが半角英数字だと登録できない" do
        @user.last_name = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name Full-width characters")
      end
      it "first_nameが半角英数字だと登録できない" do
        @user.first_name = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name Full-width characters")
      end
      it "last_name_kanaが空だと登録できない" do
        @user.last_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "first_name_kanaが空だと登録できない" do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "last_name_kanaが、ひらがな、漢字、英数字だと登録できない" do
        @user.last_name_kana = "あ阿a1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana Full-width katakana characters")
      end
      it "first_name_kanaが、ひらがな、漢字、英数字だと登録できない" do
        @user.first_name_kana = "あ阿a1"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters")
      end
      it "birth_dateが空だと登録できない" do
        @user.birth_date = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end

    end
    context '新規登録がうまくいくとき' do
      it "nameとemail、passwordとpassword_confirmation、
          profileとoccupationとpositionが存在すれば登録できる" do
          expect(@user).to be_valid
      end
    end
  end
end