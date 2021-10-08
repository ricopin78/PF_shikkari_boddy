require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do

  describe 'バリデーションのテスト' do

    context '必須項目が入力されていない場合' do
      let(:user) { build(:user, last_name: nil, first_name: nil, last_name_kana: nil, first_name_kana: nil, email: nil, company: nil, password: nil)}

      it "last_nameを登録できず、エラーメッセージが表示されること" do
        user.valid?
        expect(user.errors[:last_name]).to include("が入力されていません。")
      end

      it "first_nameを登録できず、エラーメッセージが表示されること" do
        user.valid?
        expect(user.errors[:first_name]).to include("が入力されていません。")
      end

      it "last_name_kanaを登録できず、エラーメッセージが表示されること" do
        user.valid?
        expect(user.errors[:last_name_kana]).to include("が入力されていません。")
      end

      it "first_name_kanaを登録できず、エラーメッセージが表示されること" do
        user.valid?
        expect(user.errors[:first_name_kana]).to include("が入力されていません。")
      end

      it "emailを登録できず、エラーメッセージが表示されること" do
        user.valid?
        expect(user.errors[:email]).to include("が入力されていません。")
      end

      it "companyを登録できず、エラーメッセージが表示されること" do
        user.valid?
        expect(user.errors[:company]).to include("が入力されていません。")
      end

      it "passwordを登録できず、エラーメッセージが表示されること" do
        user.valid?
        expect(user.errors[:password]).to include("が入力されていません。")
      end

    end

    context '重複したメールアドレスの場合' do

      it "無効であること" do
        user1 = FactoryBot.create(:user)
        user2 = FactoryBot.build(:user)
        user2.valid?
        expect(user2.errors[:email]).to include("は既に使用されています。")
      end

    end

    context 'ふりがなの入力規則が異なる場合' do

      it "last_name_kanaは無効であること" do
        expect(user[:last_name_kana]).to match(/\A[ぁ-んァ-ヶー－]+\z/)
      end

    end

  end

end
