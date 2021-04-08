require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "正常系の機能" do
    let(:new_post) { FactoryBot.build(:post) }
    context "登録をする" do
      it "正しく申し送りが投稿できること" do
        expect(new_post).to be_valid
        new_post.save

        expect(new_post.title).to eq("事故発生")
        expect(new_post.body).to eq("太郎さんが転倒")
      end
    end
  end


  describe "入力項目" do
    let(:new_post) { FactoryBot.build(:post) }
   context "入力必須であること" do

      #バリデーションエラー
      it "タイトルが必須であること" do
        expect(new_post).not_to be_valid
        expect(new_post.errors[:title]).to include(I18n.t('errors.messages.blank'))
      end 

      it "内容が必須であること" do
        expect(new_post).not_to be_valid
        expect(new_post.errors[:body]).to include(I18n.t('errors.messages.blank'))
      end 

    end
  end
end
