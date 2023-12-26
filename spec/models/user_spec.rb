require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー管理機能' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last_name can't be blank")
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First_name can't be blank")
    end
    it 'last_name_readingが空では登録できない' do
      @user.last_name_reading = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last_name_reading can't be blank")
    end
    it 'first_name_readinが空では登録できない' do
      @user.first_name_readin = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First_name_readin can't be blank")
    end
    it 'last_nameに半角文字が含まれている場合は登録できない' do
      @user.last_name = 't'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last_name is invalid")
    end
    it 'first_nameに半角文字が含まれている場合は登録できない' do
      @user.first_name = 't'
      @user.valid?
      expect(@user.errors.full_messages).to include("First_name is invalid")
    end
    it 'last_name_readingに半角文字が含まれている場合は登録できない' do
      @user.last_name_reading = 't'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last_name_reading is invalid")
    end
    it 'first_name_readinに半角文字が含まれている場合は登録できない' do
      @user.first_name_readin = 't'
      @user.valid?
      expect(@user.errors.full_messages).to include("First_name_readin is invalid")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'birthが空では登録できない' do
      @user.birth = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth can't be blank")
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
  end
end