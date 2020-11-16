require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録'  do
    context '新規登録がうまくいくとき' do
      it '必須項目(nickname,email,password,password_confirmation,first_name,last_name,kana_first_name,kana_last_name,birth_date)が存在すればうまくいく' do
        
      end
      it 'passwordが6文字以上であれば登録できる' do
      end
      it 'passwordが半角英数字混合6文字以上であれば登録できる' do
      end
      it 'first_nameが全角(漢字・カタカナ・ひらがな)であれば登録できる' do
      end
      it 'last_nameが全角(漢字・カタカナ・ひらがな)であれば登録できる' do
      end
    end

    context '新規登録がうまくいかない時' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
     
      it 'emailが空だと登録できない' do
        @user.email = ""
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

      it 'emailが@を含んでいない場合登録できない' do
        @user.email = "sample"
        @user.valid?
        binding.pry
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空だと登録できない' do
      end
      it 'passwordが5文字以下であれば登録できない' do
      end
      it 'passwordが半角英数字混合でなければ登録できない' do
      end
      it 'passwordが存在してもpassword_confirmation空だと登録できない' do
      end
      it 'first_nameが空だと登録できない' do
      end
      it 'first_nameが全角(漢字・カタカナ・ひらがな)でなければ登録できない' do
      end
      it 'last_nameが空だと登録できない' do
      end
      it 'last_nameが全角(漢字・カタカナ・ひらがな)でなければ登録できない' do
      end
      it 'kana_first_nameが空だと登録できない' do
      end
      it 'kana_first_nameが全角(カタカナ)でなければ登録できない' do
      end
      it 'kana_last_nameが空だと登録できない' do
      end
      it 'birth_dateが空だと登録できない' do
      end
      it '' do
      end
      it '' do
      end
    end
  end
end
