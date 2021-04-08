require 'rails_helper'

RSpec.describe CareRecipitent, type: :model do
  describe "入力項目" do
    context "入力必須であること" do
       it "名字が必須であること" do
         #バリデーションエラー
         care_recipitent = CareRecipitent.new
         expect(care_recipitent).not_to be_valid
         expect(care_recipitent.errors[:family_name]).to include(I18n.t('errors.messages.blank'))
       end 
 
       it "名前が必須であること" do
         care_recipitent= CareRecipitent.new
         expect(care_recipitent).not_to be_valid
         expect(care_recipitent.errors[:given_name]).to include(I18n.t('errors.messages.blank'))
       end
 
       it "名前(カナ)が必須であること" do
         care_recipitent= CareRecipitent.new
         expect(care_recipitent).not_to be_valid
         expect(care_recipitent.errors[:family_name_kana]).to include(I18n.t('errors.messages.blank'))
       end
 
       it "名前(カナ)が必須であること" do
         care_recipitent= CareRecipitent.new
         expect(care_recipitent).not_to be_valid
         expect(care_recipitent.errors[:given_name_kana]).to include(I18n.t('errors.messages.blank'))
       end
 
       it "年齢が必須であること" do
         care_recipitent= CareRecipitent.new
         expect(care_recipitent).not_to be_valid
         expect(care_recipitent.errors[:age]).to include(I18n.t('errors.messages.blank'))
       end
 
       it "性別の入力が必須であること" do
         care_recipitent= CareRecipitent.new
         expect(care_recipitent).not_to be_valid
         expect(care_recipitent.errors[:gender]).to include(I18n.t('errors.messages.blank'))
       end
 
       it "誕生日が必須であること" do
         care_recipitent= CareRecipitent.new
         expect(care_recipitent).not_to be_valid
         expect(care_recipitent.errors[:birthday]).to include(I18n.t('errors.messages.blank'))
       end

       it "要支援度は２までであること" do
        care_recipitent= CareRecipitent.new
        care_recipitent.degree_of_support_required = 3
        expect(care_recipitent).not_to be_valid
        expect(care_recipitent.errors[:degree_of_support_required]).to include(I18n.t('errors.messages.blank'))
      end

        it "登録できないこと" do
         #空の登録だと保存に失敗
         new_care_recipitent= CareRecipitent.new
         expect(care_recipitent.save).to be_falsey
        end
     end
   end
 
   describe "値の正規化" do
     it "family_name_kanaに含まれる半角カナを変換" do
       care_recipitent= create(:care_recipitent, family_name_kana: "ﾃｽﾄ")
       expect(care_recipitent.family_name_kana).to eq("テスト")
     end
 
     it "アルファベット表記のfamily_nameは有効" do
       care_recipitent= build(:care_recipitent, family_name: "Smith")
       expect(care_recipitent).to be_valid
     end
 
     it "記号を含むfamily_nameは無効" do
       care_recipitent= build(:care_recipitent, family_name: "&試験#*")
       expect(care_recipitent).not_to be_valid
     end
 
     it "漢字を含むfamily_name_kanaは無効" do
       care_recipitent= build(:care_recipitent, family_name_kana: "試験")
       expect(care_recipitent).not_to be_valid
     end
   end

end
