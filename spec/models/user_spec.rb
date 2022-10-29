require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
   context '新規登録出来ない時' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nicknameを入力してください")
    end
    it 'birth_dayが空では登録できない' do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth dayを入力してください")
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First nameを入力してください")
    end
    it 'family_nameが空では登録できない' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family nameを入力してください")
    end
    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanaを入力してください")
    end
    it 'family_name_kanaが空では登録できない' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kanaを入力してください")
    end
    it 'first_nameはひらがな、カタカナ、漢字のいずれかでなければ登録できない' do
      @user.first_name = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include('First nameは不正な値です')

    end
    it 'family_nameはひらがな、カタカナ、漢字のいずれかでなければ登録できない' do
      @user.family_name = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family nameは不正な値です')
    end
    it 'first_name_kanaはカタカナでなければ登録できない' do
      @user.first_name_kana = 'やまだ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kanaは不正な値です')
    end
    it 'family_name_kanaはカタカナでなければ登録できない' do
      @user.family_name_kana = 'たろう'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name kanaは不正な値です')
    end
    it 'passwordは英字のみでは登録できない' do
      @user.password = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include('Passwordは不正な値です')
    end
    it 'passwordは数字のみでは登録できない' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Passwordは不正な値です')
    end
    it 'passwordは全角文字を含むと登録できない' do
      @user.password = '12abあい'
      @user.valid?
      expect(@user.errors.full_messages).to include('Passwordは不正な値です')
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Passwordを入力してください')

    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '12345a'
      @user.password_confirmation = '12345b'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmationとPasswordの入力が一致しません")
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '1234'
      @user.valid?
      expect(@user.errors.full_messages).to include("Passwordは6文字以上で入力してください")

    end
    it 'passwordが129文字以上では登録できない' do
      @user.password = Faker::Internet.password(min_length: 129)
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Passwordは128文字以内で入力してください")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Emailを入力してください")

    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Emailはすでに存在します")
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include("Emailは不正な値です")
    end
  end
   context '新規登録出来る時' do
     it 'nickname,birth_day,first_name,family_name,first_name_kana,
         family_name_kana,password,emailが存在すれば登録出来る' do
          expect(@user).to be_valid
     end
   end
  end
end