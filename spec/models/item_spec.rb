require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品を出品出来ない時' do
      it 'nameが無ければ出品出来ない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Nameを入力してください")
      end
      it 'imageが無ければ出品出来ない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Imageを入力してください")
      end
      it 'textが無ければ出品出来ない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Textを入力してください")
      end
      it 'userと紐づいていなければ出品出来ない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Userを入力してください")
      end
      it 'priceが無ければ出品出来ない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Priceを入力してください")
      end
      it 'priceは全て半角数値出なければ登録できない' do
        @item.price = 'abcd'
        @item.valid?
        expect(@item.errors.full_messages).to include("Priceは数値で入力してください")
      end
      it 'priceは299以下では登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Priceは300以上の値にしてください")
      end
      it 'priceは10000000以上では登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Priceは9999999以下の値にしてください")
      end
      it 'category_idが1だと登録出来ない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Categoryは1以外の値にしてください")
      end
      it 'condition_idが1だと登録出来ない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Conditionは1以外の値にしてください")
      end
      it 'postage_idが1だと登録出来ない' do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Postageは1以外の値にしてください")
      end
      it 'shipping_area_idが0だと登録出来ない' do
        @item.shipping_area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping areaは0以外の値にしてください")
      end
      it 'shipping_days_idが1だと登録出来ない' do
        @item.shipping_days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping daysは1以外の値にしてください")
      end
    end
    context '商品を出品出来る時' do
      it '全ての情報を登録すると出品出来る' do
        expect(@item).to be_valid
      end

    end
    

  end

  
end
