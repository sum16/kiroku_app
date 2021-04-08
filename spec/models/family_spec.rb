require 'rails_helper'

RSpec.describe Family, type: :model do
  describe "正常系の機能" do

    context "登録をする" do
    it "正しくスタッフ登録ができること" do

    family = FactoryBot.build(:family)
      expect(family).to be_valid
      family.save

      expect(family.family_name).to eq("佐藤")
      expect(family.given_name).to eq("恵子")
      expect(family.family_name_kana).to eq("サトウ")
      expect(family.given_name_kana).to eq("ケイコ")
      expect(family.address).to eq("山形県")
      expect(family.relationship).to eq("娘")
      expect(family.care_recipitent_name).to eq("佐藤太郎")
      expect(family.gender).to eq("female")

    end
  end
end

  describe "入力項目" do
   context "入力必須であること" do
      it "名字が必須であること" do
        #バリデーションエラー
        family = Family.new
        expect(family).not_to be_valid
        expect(family.errors[:family_name]).to include(I18n.t('errors.messages.blank'))
      end 

      it "名前が必須であること" do
        family = Family.new
        expect(family).not_to be_valid
        expect(family.errors[:given_name]).to include(I18n.t('errors.messages.blank'))
      end

      it "名前(カナ)が必須であること" do
        family = Family.new
        expect(family).not_to be_valid
        expect(family.errors[:family_name_kana]).to include(I18n.t('errors.messages.blank'))
      end

      it "名前(カナ)が必須であること" do
        family = Family.new
        expect(family).not_to be_valid
        expect(family.errors[:given_name_kana]).to include(I18n.t('errors.messages.blank'))
      end

      it "パスワードが必須であること" do
        family = Family.new
        expect(family).not_to be_valid
        expect(family.errors[:password]).to include(I18n.t('errors.messages.blank'))
      end

      it "関係性の入力が必須であること" do
        family = Family.new
        expect(family).not_to be_valid
        expect(family.errors[:relationship]).to include(I18n.t('errors.messages.blank'))
      end

      it "住所が必須であること" do
        family = Family.new
        expect(family).not_to be_valid
        expect(family.errors[:address]).to include(I18n.t('errors.messages.blank'))
      end

      it "性別が必須であること" do
        family = Family.new
        expect(family).not_to be_valid
        expect(family.errors[:gender]).to include(I18n.t('errors.messages.blank'))
      end

       it "登録できないこと" do
        #空の登録だと保存に失敗
        new_family = Family.new
        expect(new_family.save).to be_falsey
       end
      

      context '任意入力であること' do
        it '続柄の入力が任意であること' do
          new_family = Family.new
          expect(new_family).not_to be_valid
          expect(new_family.errors[:care_recipitent_name]).not_to include(I18n.t('errors.messages.blank'))
        end
      end
    end
  end

  describe "値の正規化" do
    it "family_name_kanaに含まれる半角カナを変換" do
      family = create(:family, family_name_kana: "ﾃｽﾄ")
      expect(family.family_name_kana).to eq("テスト")
    end

    it "アルファベット表記のfamily_nameは有効" do
      family = build(:family, family_name: "Smith")
      expect(family).to be_valid
    end

    it "記号を含むfamily_nameは無効" do
      family = build(:family, family_name: "&試験#*")
      expect(family).not_to be_valid
    end

    it "漢字を含むfamily_name_kanaは無効" do
      family = build(:family, family_name_kana: "試験")
      expect(family).not_to be_valid
    end
  end

end
