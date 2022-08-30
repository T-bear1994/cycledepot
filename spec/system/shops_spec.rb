require 'rails_helper'

RSpec.describe "Shops", type: :system do
  describe 'shop CRUD' do
    before do
      User.create!(name: "Michael", email: "michael@gmail.com", password: "michael", admin: true)
      User.create!(name: "Tracy", email: "tracy@gmail.com", password: "hellotracy", admin: false)
    end
    context 'when user tries to create a shop' do
      it 'Only admin user is able to create shops' do
        visit root_path
        click_link 'ログイン'
        fill_in 'Eメール', with: "tracy@gmail.com"
        fill_in 'パスワード', with: "hellotracy"
        click_button 'ログイン'
        visit new_shop_path
        expect(page).to have_content 'Cycle Depot'
        click_link 'ログアウト'
        click_link 'ログイン'
        fill_in 'Eメール', with: "michael@gmail.com"
        fill_in 'パスワード', with: "michael"
        click_button 'ログイン'
        visit new_shop_path
        select '東京都', from: "shop[prefecture]"
        fill_in '市区町村', with: "渋谷区"
        fill_in '住所', with: "松濤1-1-1"
        fill_in '緯度', with: "30.00000"
        fill_in '経度', with: "135.00000"
        fill_in '営業時間', with: "24時間365日営業"
        check 'shop_cashless'
        click_button '作成する'
        expect(page).to have_content 'エラーが検出されました。'
        fill_in '名称', with: "ロードバイクカフェ"
        select '東京都', from: "shop[prefecture]"
        fill_in '市区町村', with: "渋谷区"
        fill_in '住所', with: "松濤1-1-1"
        fill_in '緯度', with: "30.00000"
        fill_in '経度', with: "135.00000"
        fill_in '営業時間', with: "24時間365日営業"
        check 'shop_cashless'
        click_button '作成する'
        expect(page).to have_content 'ショップが登録されました。'
        expect(page).to have_content 'ロードバイクカフェ'
      end
    end
    context 'when user tries to update and delete a shop' do
      before do
        Shop.create!(name: "ロードバイクカフェ", prefecture: "東京都", city: "渋谷区", address: "代々木1-1-1", latitude: "30.00000", longitude: "130.00000", business_hour: "24/7", cashless: true, bike_rack: false, remarks: "This is a chill spot")
      end
      it 'only admin user is able to update' do
        visit root_path
        click_link 'ログイン'
        fill_in 'Eメール', with: "tracy@gmail.com"
        fill_in 'パスワード', with: "hellotracy"
        click_button 'ログイン'
        visit shop_path(Shop.first.id)
        expect(page).not_to have_content '編集'
        click_link 'ログアウト'
        click_link 'ログイン'
        fill_in 'Eメール', with: "michael@gmail.com"
        fill_in 'パスワード', with: "michael"
        click_button 'ログイン'
        visit shop_path(Shop.first.id)
        click_link '編集'
        fill_in '名称', with: "ROADBIKE Cafe"
        click_button '更新する'
        expect(page).to have_content 'ショップ情報が更新されました。'
        expect(page).to have_content 'ROADBIKE Cafe'
      end
      it 'admin user is able to delete shops' do
        visit root_path
        click_link 'ログイン'
        fill_in 'Eメール', with: "michael@gmail.com"
        fill_in 'パスワード', with: "michael"
        click_button 'ログイン'
        visit shop_path(Shop.first.id)
        click_link '削除'
        expect(page).to have_content 'ショップ情報が削除されました。'
        expect(page).not_to have_content 'ロードバイクカフェ'
      end
    end
  end
  describe 'Access Restriction' do
    context 'when users tries to access shop related pages' do
      it 'only admin user is able to access new shops path' do
        User.create!(name: "Michael", email: "michael@gmail.com", password: "michael", admin: true)
        visit root_path
        click_link 'ログイン'
        fill_in 'Eメール', with: 'michael@gmail.com'
        fill_in 'パスワード', with: 'michael'
        click_button 'ログイン'
        click_link 'ショップ登録'
        expect(page).to have_content 'ショップ情報登録'
      end
    end
  end
end
