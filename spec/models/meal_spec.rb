require 'rails_helper'

RSpec.describe Meal, type: :model do
  describe "入力項目" do
   context "入力必須であること" do

      #バリデーションエラー
      it "朝食の入力が必須であること" do
        new_meal = Meal.new
        expect(new_meal).not_to be_valid
        expect(new_meal.errors[:breakfast]).to include(I18n.t('errors.messages.blank'))
      end 

      it "昼食の入力が必須であること" do
        new_meal = Meal.new
        expect(new_meal).not_to be_valid
        expect(new_meal.errors[:lunch]).to include(I18n.t('errors.messages.blank'))
      end 

      it "おやつの入力が必須であること" do
        new_meal = Meal.new
        expect(new_meal).not_to be_valid
        expect(new_meal.errors[:snack]).to include(I18n.t('errors.messages.blank'))
      end 

      it "夕食の入力が必須であること" do
        new_meal = Meal.new
        expect(new_meal).not_to be_valid
        expect(new_meal.errors[:dinner]).to include(I18n.t('errors.messages.blank'))
      end 

      it "日付が必須であること" do
        new_meal = Meal.new
        expect(new_meal).not_to be_valid
        expect(new_meal.errors[:meal_date]).to include(I18n.t('errors.messages.blank'))
      end 

    end
  end
end
