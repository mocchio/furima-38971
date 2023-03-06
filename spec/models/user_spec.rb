require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it 'ユーザー情報が全て揃っていれば新規登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない時' do
      it 'nicknameが空の時、新規登録はできない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空の時、新規登録はできない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空の時、新規登録はできない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下の時、新規登録はできない' do
        @user.password = 'abc12'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが129文字以上の時、新規登録ができない' do
        @user.password = Faker::Internet.password(min_length: 129, mix_case: true, special_characters: false)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
      end
      it 'passwordとpassword_confirmationが不一致では新規登録はできない' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abcd123'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'emailが重複していると新規登録はできない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailには@を含まなければ新規登録できない' do
        @user.email = 'test.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが英字のみの時、新規登録はできない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが数字のみの時、新規登録はできない' do
        @user.password = '111111'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'name_lastが空の時、新規登録はできない' do
        @user.name_last = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name last can't be blank")
      end
      it 'name_lastに半角文字が含まれている時、新規登録はできない' do
        @user.name_last = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name last is invalid")
      end
      it 'name_firstが空の時、新規登録はできない' do
        @user.name_first = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name first can't be blank")
      end
      it 'name_firstに半角文字が含まれている時、新規登録はできない' do
        @user.name_first = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name first is invalid")
      end
      it 'name_last_kanaが空の時、新規登録はできない' do
        @user.name_last_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name last kana can't be blank")
      end
      it 'name_last_kanaに半角文字が含まれている時、新規登録はできない' do
        @user.name_last_kana = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name last kana is invalid")
      end
      it 'name_last_kanaにひらがなが含まれている時、新規登録ができない' do
        @user.name_last_kana = 'ひらがな'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name last kana is invalid")
      end
      it 'name_first_kanaが空の時、新規登録はできない' do
        @user.name_first_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name first kana can't be blank")
      end
      it 'name_first_kanaに半角文字が含まれている時、新規登録はできない' do
        @user.name_first_kana = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name first kana is invalid")
      end
      it 'name_first_kanaにひらがなが含まれている時、新規登録ができない' do
        @user.name_first_kana = 'ひらがな'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name first kana is invalid")
      end
      it 'date_of_birthが空の時、新規登録はできない' do
        @user.date_of_birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Date of birth can't be blank")
      end
    end
  end
end
