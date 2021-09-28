require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { build(:user, last_name: nil)}


  describe '#create' do
    it "last_nameがない場合は登録できないこと" do
      user.valid?
      expect(user.errors[:last_name]).to include("が入力されていません。")
    end
  end

end