require 'rails_helper'

RSpec.describe Medicine, type: :model do
 
  describe "正常系の機能" do
    let(:new_medicine) { FactoryBot.build(:medicine) }
    context "登録をする" do

    it "正しく薬チェックが登録できること" do
      expect(new_medicine).to be_valid
      new_medicine.save

      expect(new_medicine.check_before_breakfast).to eq(true)
      expect(new_medicine.check_after_breakfast).to eq(false)
      expect(new_medicine.check_before_lunch).to eq(true)
      expect(new_medicine.check_after_lunch).to eq(false)
      expect(new_medicine.check_before_dinner).to eq(true)
      expect(new_medicine.check_after_dinner).to eq(false)
      expect(new_medicine.check_eye_drops).to eq(true)
      expect(new_medicine.check_ointment).to eq(false)
    end
  end
end

  

describe "入力項目" do
   context "入力必須であること" do
      #バリデーションエラー
      it "タイトルが必須であること" do
        new_medicine = Medicine.new
        expect(new_medicine).not_to be_valid
        expect(new_medicine.errors[:check_before_breakfast]).to include(I18n.t('errors.messages.blank'))
      end 

      it "内容が必須であること" do
        new_medicine = Medicine.new
        expect(new_medicine).not_to be_valid
        expect(new_medicine.errors[:check_after_breakfast]).to include(I18n.t('errors.messages.blank'))
      end 

      it "内容が必須であること" do
        new_medicine = Medicine.new
        expect(new_medicine).not_to be_valid
        expect(new_medicine.errors[:check_before_lunch]).to include(I18n.t('errors.messages.blank'))
      end 

      it "内容が必須であること" do
        new_medicine = Medicine.new
        expect(new_medicine).not_to be_valid
        expect(new_medicine.errors[:check_after_lunch]).to include(I18n.t('errors.messages.blank'))
      end 

      it "内容が必須であること" do
        new_medicine = Medicine.new
        expect(new_medicine).not_to be_valid
        expect(new_medicine.errors[:check_before_dinner]).to include(I18n.t('errors.messages.blank'))
      end 

      it "内容が必須であること" do
        new_medicine = Medicine.new
        expect(new_medicine).not_to be_valid
        expect(new_medicine.errors[:check_after_dinner]).to include(I18n.t('errors.messages.blank'))
      end 

      it "内容が必須であること" do
        new_medicine = Medicine.new
        expect(new_medicine).not_to be_valid
        expect(new_medicine.errors[:check_eye_drops]).to include(I18n.t('errors.messages.blank'))
      end 

      it "内容が必須であること" do
        new_medicine = Medicine.new
        expect(new_medicine).not_to be_valid
        expect(new_medicine.errors[:check_ointment]).to include(I18n.t('errors.messages.blank'))
      end 

    end
  end
end

