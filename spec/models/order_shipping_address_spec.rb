require 'rails_helper'

RSpec.describe OrderShippingAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_shipping_address = FactoryBot.build(:order_shipping_address, user_id: @user.id, item_id: @item.id)
    sleep(0.1)
  end

  describe '商品購入' do
    context '商品購入ができる場合' do
      it '全ての配送先情報が揃っていれば商品購入ができる' do
        expect(@order_shipping_address).to be_valid
      end
      it 'building_nameがなくても商品購入ができる' do
        @order_shipping_address.building_name = ""
        expect(@order_shipping_address).to be_valid
      end
    end

    context '商品購入ができない場合' do
      it 'post_codeが空の場合、商品購入ができない' do
        @order_shipping_address.post_code = ""
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'prefectureが空の場合、商品購入ができない' do
        @order_shipping_address.prefecture_id = 1
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalitiesが空の場合、商品購入ができない' do
        @order_shipping_address.municipalities = ""
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'addressが空の場合、商品購入ができない' do
        @order_shipping_address.address = ""
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephone_numberが空の場合、商品購入ができない' do
        @order_shipping_address.telephone_number = ""
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'post_codeにハイフンがない場合、商品購入ができない' do
        @order_shipping_address.post_code = "1234567"
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it '郵便番号に全角文字が含まれている場合、商品購入はできない' do
        @order_shipping_address.post_code = "１２３−４５６７"
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'post_codeが「3桁-4桁」の形になっていない場合、商品購入はできない' do
        @order_shipping_address.post_code = "123-456"
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'telephone_numberが9桁以下の場合、商品購入はできない' do
        @order_shipping_address.telephone_number = "090123456"
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Telephone number is too short (minimum is 10 characters)")
      end
      it 'telephone_numberが12桁以上の場合、商品購入はできない' do
        @order_shipping_address.telephone_number = "090123456789"
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Telephone number is too long (maximum is 11 characters)")
      end
      it '半角数字以外が含まれている場合、商品購入はできない' do
        @order_shipping_address.telephone_number = "090123456a"
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Telephone number is not a number")
      end
      it 'userと紐づいていない場合、商品購入はできない' do
        @order_shipping_address.user_id = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemと紐づいていない場合、商品購入はできない' do
        @order_shipping_address.item_id = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空の場合、商品購入はできない' do
        @order_shipping_address.token = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end