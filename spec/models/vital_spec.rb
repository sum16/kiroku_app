require 'rails_helper'

RSpec.describe Vital, type: :model do
  describe "正常系の機能" do
    let(:new_vital) { FactoryBot.build(:vital) }
    context "登録をする" do

    it "正しくバイタルができること" do
      expect(new_vital).to be_valid
      new_vital.save

      expect(new_vital.low_blood_pressure).to eq(100)
      expect(new_vital.hign_blood_pressure).to eq(125)
      expect(new_vital.breathing).to eq(60)
      expect(new_vital.pulse).to eq(60)
      expect(new_vital.temperature).to eq(36.6)
      expect(new_vital.spo2).to eq(99)
      expect(new_vital.measuring_date).to eq(Today)
    end
  end
end

  describe "入力項目" do
    let(:new_vital) { FactoryBot.build(:vital) }
   context "入力必須であること" do

      #バリデーションエラー
      it "酸素濃度が必須であること" do
        expect(new_vital).not_to be_valid
        expect(new_vital.errors[:spo2]).to include(I18n.t('errors.messages.blank'))
      end 

      it "体温が必須であること" do
        expect(new_vital).not_to be_valid
        expect(new_vital.errors[:temperature]).to include(I18n.t('errors.messages.blank'))
      end 

      it "脈拍が必須であること" do
        expect(new_vital).not_to be_valid
        expect(new_vital.errors[:pulse]).to include(I18n.t('errors.messages.blank'))
      end 

      it "呼吸回数が必須であること" do
        expect(new_vital).not_to be_valid
        expect(new_vital.errors[:breathing]).to include(I18n.t('errors.messages.blank'))
      end 

      it "血圧(下)が必須であること" do
        expect(new_vital).not_to be_valid
        expect(new_vital.errors[:low_blood_pressure]).to include(I18n.t('errors.messages.blank'))
      end 

      it "血圧(上)が必須であること" do
        expect(new_vital).not_to be_valid
        expect(new_vital.errors[:hign_blood_pressure]).to include(I18n.t('errors.messages.blank'))
      end 

    end
  end
end
