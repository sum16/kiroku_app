require 'rails_helper'

RSpec.describe BathingDay, type: :model do
  describe "入力項目" do
    context "入力必須であること" do
 
       #バリデーションエラー
       it "日付が必須であること" do
         new_bathing_day = BathingDay.new
         expect(new_bathing_day ).not_to be_valid
         expect(new_bathing_day .errors[:bathing_date]).to include(I18n.t('errors.messages.blank'))
       end 
 
       it "入浴のチャックが必須であること" do
         new_bathing_day  = BathingDay.new
         expect(new_bathing_day ).not_to be_valid
         expect(new_bathing_day .errors[:judge_bath]).to include(I18n.t('errors.messages.blank'))
       end
 
     end
   end  
end
