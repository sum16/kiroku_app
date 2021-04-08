require 'rails_helper'

RSpec.describe "FoodEnquetes", type: :system do
  describe '正常' do
    context "フォームに登録する" do
      it "登録できること" do
     
       family = FactoryBot.create(:family)
    
        visit "/family/families/new"

        fill_in '名字', with: family.family_name

        fill_in '名前', with: family.given_name

        fill_in '名字(カナ)', with: family.family_name_kana

        fill_in '名前(カナ)', with: family.given_name_kana

        fill_in '記録したい人の名前', with: family.care_recipitent_name

        fill_in 'パスワード', with: family.password

        fill_in 'パスワード確認', with: family.password_confirmation

        fill_in '続柄', with: family.relationship

        fill_in '住所', with: family.address

        fill_in '性別', with: enquete.gender
  
        click_button '登録する'

      
        expect(page).to have_content '佐藤'
        expect(page).to have_content '恵子'
        expect(page).to have_content 'サトウ'
        expect(page).to have_content 'ケイコ'
        expect(page).to have_content '佐藤太郎'
        expect(page).to have_content 'password'
        expect(page).to have_content 'password'
        expect(page).to have_content '娘'
        expect(page).to have_content '山形県'
        expect(page).to have_content 'female'
        sleep 5
      end
    end
  end

  describe '異常' do
    context "必須項目が未入力" do
      it "エラーメッセージが表示され、登録できないこと" do
        visit "/family/families/new"
        sleep 2

        click_button '登録する'
        expect(page).not_to have_content '登録が完了しました'
        expect(page).to have_content '名前を入力してください'
        expect(page).to have_content '名字を入力してください'
        expect(page).to have_content '名前(カナ)を入力してください'
        expect(page).to have_content '名字(カナ)を入力してください'
        expect(page).to have_content '記録したい人の名前を入力してください'
        expect(page).to have_content 'パスワードを入力してください'
        expect(page).to have_content '続柄を入力してください'
        expect(page).to have_content '住所を入力してください'
        expect(page).to have_content '性別を入力してください'
        sleep 5
      end
    end
  end
end
