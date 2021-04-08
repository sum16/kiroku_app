require 'rails_helper'

RSpec.describe IntakeWater, type: :model do
  describe "入力項目" do
    context "入力必須であること" do
 
       #バリデーションエラー
       it "日付が必須であること" do
         new_intake_water = IntakeWater.new
         expect(new_intake_water ).not_to be_valid
         expect(new_intake_water .errors[:drink_date]).to include(I18n.t('errors.messages.blank'))
       end 
 
       it "水分量が必須であること" do
         new_intake_water  = IntakeWater.new
         expect(new_intake_water ).not_to be_valid
         expect(new_intake_water .errors[:amount_of_water]).to include(I18n.t('errors.messages.blank'))
       end
 
     end
   end
  
end
