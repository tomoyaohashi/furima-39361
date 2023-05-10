require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'すべての内容が存在し適切に入力すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'ニックネームが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'メールアドレスが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'メールアドレスが登録済みの場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスに@がないと登録できない' do
        @user.email = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードが5文字以下では登録できない' do
        @user.password = 'abc12'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードが英字のみでは登録できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'パスワードが数字のみでは登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'パスワードが全角英数字のみでは登録できない' do
        @user.password = 'ＡＢＣ１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'パスワードとパスワード（確認）が不一致では登録できない' do
        @user.password = 'abc123'
        @user.password_confirmation = '123abc'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'お名前(全角)の名字が空では登録できない' do
        @user.surname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname can't be blank")
      end
      it 'お名前(全角)の名前が空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it 'お名前(全角)の名字が全角以外では登録できない' do
        @user.surname = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('Surname is invalid')
      end
      it 'お名前(全角)の名前が全角以外では登録できない' do
        @user.name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name is invalid')
      end
      it 'お名前カナ(全角)の名字が空では登録できない' do
        @user.surnamekana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Surnamekana can't be blank")
      end
      it 'お名前カナ(全角)の名前が空では登録できない' do
        @user.namekana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Namekana can't be blank")
      end
      it 'お名前カナ(全角)の名字がカタカナ以外では登録できない' do
        @user.surnamekana = '田中'
        @user.valid?
        expect(@user.errors.full_messages).to include('Surnamekana is invalid')
      end
      it 'お名前カナ(全角)の名前がカタカナ以外では登録できない' do
        @user.namekana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('Namekana is invalid')
      end
      it '生年月日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
