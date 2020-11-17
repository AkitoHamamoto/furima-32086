require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it '必須項目(nickname,email,password,password_confirmation,first_name,last_name,kana_first_name,kana_last_name,birth_date)が存在すればうまくいく' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかない時' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailが@を含んでいない場合登録できない' do
        @user.email = 'sample'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid', 'Email には@のつくアドレスを入力してください')
      end

      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下であれば登録できない' do
        @user.password = 'aaa11'
        @user.password_confirmation = 'aaa11'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが半角英数字混合でなければ登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end

      it 'passwordが半角数字だけでは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end

      it 'passwordが全角では登録できない' do
        @user.password = 'aaa１１１'
        @user.password_confirmation = "aaa１１１"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end

      it 'passwordが存在してもpassword_confirmation空だと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", 'First name ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須です')
      end

      it 'first_nameが全角(漢字・カタカナ・ひらがな)でなければ登録できない' do
        @user.first_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須です')
      end

      it 'last_nameが空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", 'Last name ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須です')
      end

      it 'last_nameが全角(漢字・カタカナ・ひらがな)でなければ登録できない' do
        @user.last_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須です')
      end

      it 'kana_first_nameが空だと登録できない' do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name can't be blank", 'Kana first name ユーザー本名のフリガナは、全角（カタカナ）での入力が必須で')
      end

      it 'kana_first_nameが全角(カタカナ)でなければ登録できない' do
        @user.kana_first_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana first name ユーザー本名のフリガナは、全角（カタカナ）での入力が必須で')
      end

      it 'kana_last_nameが空だと登録できない' do
        @user.kana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name can't be blank", 'Kana last name ユーザー本名のフリガナは、全角（カタカナ）での入力が必須で')
      end

      it 'kana_last_nameが全角(カタカナ)でなければ登録できない' do
        @user.kana_last_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana last name ユーザー本名のフリガナは、全角（カタカナ）での入力が必須で')
      end

      it 'birth_dateが空だと登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
