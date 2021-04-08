require 'rails_helper'

RSpec.describe BehaviorHistory, type: :model do
  describe "入力項目" do
    context "入力必須であること" do
 
       #バリデーションエラー
       it "日付が必須であること" do
         new_behavior_history= BehaviorHistory.new
         expect(new_behavior_history).not_to be_valid
         expect(new_behavior_history.errors[:behavior_history_date]).to include(I18n.t('errors.messages.blank'))
       end 
 
       it "時間が必須であること" do
         new_behavior_history = BehaviorHistory.new
         expect(new_behavior_history).not_to be_valid
         expect(new_behavior_history.errors[:behavior_time]).to include(I18n.t('errors.messages.blank'))
       end

       it "活動記録が必須であること" do
        new_behavior_history = BehaviorHistory.new
        expect(new_behavior_history).not_to be_valid
        expect(new_behavior_history.errors[:action_record]).to include(I18n.t('errors.messages.blank'))
      end

     end
   end
end
