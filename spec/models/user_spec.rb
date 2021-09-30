require 'rails_helper'

RSpec.describe User, type: :model do

  describe '#create' do
    let(:user) { build(:user, last_name: nil, first_name: nil, last_name_kana: nil, first_name_kana: nil, email: nil, company: nil, password: nil)}
    it "last_nameがない場合は登録できないこと" do
      user.valid?
      expect(user.errors[:last_name]).to include("が入力されていません。")
    end

    it "first_nameがない場合は登録できないこと" do
      user.valid?
      expect(user.errors[:first_name]).to include("が入力されていません。")
    end

    it "last_name_kanaがない場合は登録できないこと" do
      user.valid?
      expect(user.errors[:last_name_kana]).to include("が入力されていません。")
    end

    it "first_name_kanaがない場合は登録できないこと" do
      user.valid?
      expect(user.errors[:first_name_kana]).to include("が入力されていません。")
    end

    it "emailがない場合は登録できないこと" do
      user.valid?
      expect(user.errors[:email]).to include("が入力されていません。")
    end

    it "companyがない場合は登録できないこと" do
      user.valid?
      expect(user.errors[:company]).to include("が入力されていません。")
    end

    it "passwordがない場合は登録できないこと" do
      user.valid?
      expect(user.errors[:password]).to include("が入力されていません。")
    end

    it "重複したメールアドレスの場合無効である" do
      user1 = FactoryBot.create(:user)
      user2 = FactoryBot.build(:user)
      user2.valid?
      expect(user2.errors[:email]).to include("は既に使用されています。")
    end


  end

end