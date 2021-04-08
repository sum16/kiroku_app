require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe "値の正規化" do
    it "family_name_kanaに含まれる半角カナを変換" do
      customer= create(:customer, family_name_kana: "ﾃｽﾄ")
      expect(customer.family_name_kana).to eq("テスト")
    end

    it "アルファベット表記のfamily_nameは有効" do
      customer= build(:customer, family_name: "Smith")
      expect(customer).to be_valid
    end

    it "記号を含むfamily_nameは無効" do
      customer= build(:customer, family_name: "&試験#*")
      expect(customer).not_to be_valid
    end

    it "漢字を含むfamily_name_kanaは無効" do
      customer= build(:customer, family_name_kana: "佐とう")
      expect(customer).not_to be_valid
    end
  end

end
