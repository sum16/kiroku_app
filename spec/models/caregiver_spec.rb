require 'rails_helper'

RSpec.describe Caregiver, type: :model do
    describe "正常系の機能" do
      context "登録をする" do
      it "正しくスタッフ登録ができること" do
       
        new_caregiver = FactoryBot.build(:caregiver)

        expect(new_caregiver).to be_valid
        new_caregiver.save

        #名前、年齢、パスワードが一致する
        expect(new_caregiver.name).to eq("田中太郎")
        expect(new_caregiver.password).to eq("password")
        expect(new_caregiver.age).to eq(30)

         #名前、年齢、パスワードが一致しない
         expect(new_caregiver.name).not_to eq("田中二郎")
         expect(new_caregiver.password).not_to eq("password111")
         expect(new_caregiver.age).not_to eq(29)
      end

      it "登録できないこと" do
        #保存に失敗
        new_caregiver = Caregiver.new
        expect(new_caregiver.save).to be_falsey
       end

       it "名前が必須であること" do
        new_caregiver = Caregiver.new
        expect(new_caregiver).not_to be_valid
        expect(new_caregiver.errors[:name]).to include(I18n.t('errors.messages.blank'))
      end

      it "名前が必須であること" do
        new_caregiver = Caregiver.new
        expect(new_caregiver).not_to be_valid
        expect(new_caregiver.errors[:name]).to include(I18n.t('errors.messages.blank'))
      end

      it "年齢が必須であること" do
        new_caregiver = Caregiver.new
        expect(new_caregiver).not_to be_valid
        expect(new_caregiver.errors[:age]).to include(I18n.t('errors.messages.blank'))
      end

      it "パスワードが必須であること" do
        new_caregiver = Caregiver.new
        expect(new_caregiver).not_to be_valid
        expect(new_caregiver.errors[:password]).to include(I18n.t('errors.messages.blank'))
      end
    end
  end

end
