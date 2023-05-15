require 'rails_helper'

RSpec.describe HistoryBuy, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @buy = FactoryBot.build(:history_buy, user_id: user.id, item_id: item.id)
  end
 
  describe '商品購入' do
    context '商品を購入できる場合' do
      it ' 必要な情報を適切に入力すると商品の購入ができる' do
        expect(@buy).to be_valid
      end
      it ' 建物名が空でも購入できる' do
        @buy.building = ''
        expect(@buy).to be_valid
      end
    end
  end

  context '商品を購入できない場合' do
    it '郵便番号が空では購入できない' do
      @buy.postal_id = ''
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Postal can't be blank")
    end
    it '郵便番号がハイフンがないと購入できない' do
      @buy.postal_id = '1231234'
      @buy.valid?
      expect(@buy.errors.full_messages).to include('Postal is invalid. Include hyphen(-)')
    end
    it '郵便番号が８桁以上では購入できない' do
      @buy.postal_id = '123-45678'
      @buy.valid?
      expect(@buy.errors.full_messages).to include('Postal is invalid. Include hyphen(-)')
    end
    it '郵便番号が6桁以下では購入できない' do
      @buy.postal_id = '123-456'
      @buy.valid?
      expect(@buy.errors.full_messages).to include('Postal is invalid. Include hyphen(-)')
    end
    it '都道府県が空では購入できない' do
      @buy.prefecture_id = '1'
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '市区町村が空では購入できない' do
      @buy.city = ''
      @buy.valid?
      expect(@buy.errors.full_messages).to include("City can't be blank")
    end
    it '番地が空では購入できない' do
      @buy.address = ''
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Address can't be blank")
    end
    it '電話番号が空では購入できない' do
      @buy.phone = ''
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Phone can't be blank")
    end
    it '電話番号が全角数値では購入できない' do
      @buy.phone = '１２３４５６７８９０１'
      @buy.valid?
      expect(@buy.errors.full_messages).to include('Phone should be 10 to 11 digits')
    end
    it '電話番号が12桁以上では購入できない' do
      @buy.phone = '123456789012'
      @buy.valid?
      expect(@buy.errors.full_messages).to include('Phone should be 10 to 11 digits')
    end
    it '電話番号が9桁以内では購入できない' do
      @buy.phone = '123456789'
      @buy.valid?
      expect(@buy.errors.full_messages).to include('Phone should be 10 to 11 digits')
    end

    it 'tokenが空では購入できない' do
      @buy.token = ''
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Token can't be blank")
    end
    it 'userが紐付いていなければ購入できない' do
      @buy.user_id = nil
      @buy.valid?
      expect(@buy.errors.full_messages).to include("User can't be blank")
    end
    it 'itemが紐付いていなければ購入できない' do
      @buy.item_id = nil
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Item can't be blank")
    end
  end
end
