require 'rails_helper'

RSpec.describe Excreta, type: :model do
  describe "入力項目" do
    context "入力必須であること" do
 
       #バリデーションエラー
       it "排便が必須であること" do
         new_excreata = Excreta.new
         expect(new_excreata ).not_to be_valid
         expect(new_excreata .errors[:excreta_date]).to include(I18n.t('errors.messages.blank'))
       end 
 
       it "排尿が必須であること" do
         new_excreata  = Excreta.new
         expect(new_excreata ).not_to be_valid
         expect(new_excreata .errors[:judge_pee]).to include(I18n.t('errors.messages.blank'))
       end

       it "日付が必須であること" do
        new_excreata  = Excreta.new
        expect(new_excreata ).not_to be_valid
        expect(new_excreata .errors[:judge_shit]).to include(I18n.t('errors.messages.blank'))
      end
 
     end
   end
end
