require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  
  describe '商品の購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buy_address = FactoryBot.build(:buy_address, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buy_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @buy_address.building = ''
        expect(@buy_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @buy_address.post_code = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeにハイフンがないと保存できないこと' do
        @buy_address.post_code = '1231234'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Post code is invalid")
      end
      it 'shipping_idが空だと保存できないこと' do
        @buy_address.shipping_id = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Shipping can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @buy_address.city = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("City can't be blank")
      end
      it 'street_addressが空だと保存できないこと' do
        @buy_address.street_address = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Street address can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @buy_address.phone_number = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが9桁以下では保存できないこと' do
        @buy_address.phone_number = '5'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが12桁以上では保存できないこと' do
        @buy_address.phone_number = '15'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberにハイフンがあると保存できないこと' do
        @buy_address.phone_number = '-'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone number is invalid")
      end
      it "tokenが空では登録できないこと" do
        @buy_address.token = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'shipping_idが1では保存できない' do
        @buy_address.shipping_id = '1'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Shipping can't be blank")
      end
      it 'userが紐付いていないと保存できないこと' do
        @buy_address.user_id = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @buy_address.item_id = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end

end