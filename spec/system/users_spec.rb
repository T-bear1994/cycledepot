require 'rails_helper'

RSpec.describe "Users related function", type: :system do
  describe 'User CRUD' do
    context 'when the one successfully create an account' do
      it 'redirect to root path' do
        visit new_user_registration_path
        fill_in 'ユーザーネーム', with: 'Michael'
        fill_in 'Eメール', with: 'michael@gmail.com'
        fill_in 'パスワード', with: 'michael'
        fill_in 'パスワード（確認用）', with: 'michael'
        click_on 'アカウント登録'
        expect(page).to have_content 'Cycle Depot'
        expect(page).to have_content 'アカウント登録が完了しました。'
      end
    end
    context 'when the one tries to edit user info' do
      before do
        User.create!(name: "Michael", email: "michael@gmail.com", password: "michael")
      end
      it 'will work' do
        visit new_user_session_path
        fill_in 'Eメール', with: 'michael@gmail.com'
        fill_in 'パスワード', with: 'michael'
        click_button 'ログイン'
        click_link 'マイページ'
        click_link '編集'
        fill_in 'ユーザーネーム', with: 'Mike'
        fill_in 'パスワード', with: 'michael'
        fill_in 'パスワード（確認用）', with: 'michael'
        fill_in '現在のパスワード', with: 'michael'
        click_button '更新'
        expect(page).to have_content 'アカウント情報を変更しました。'
        click_link 'マイページ'
        expect(page).to have_content 'Mike'
      end
    end
    context 'when users delete their accout' do
      before do
        User.create!(name: "Michael", email: "michael@gmail.com", password: "michael")
        visit new_user_session_path
        fill_in 'Eメール', with: 'michael@gmail.com'
        fill_in 'パスワード', with: 'michael'
        click_button 'ログイン'
      end
      it 'will work and redirect to root path' do
        click_link 'マイページ'
        click_link '編集'
        click_button 'アカウント削除'
        expect(page).to have_content 'アカウントを削除しました。'
        expect(page).to have_content 'Cycle Depot'
      end
    end
  end
  describe 'User Session' do
    context 'when non logged-in user tries to access to my page' do
      before do
        User.create!(name: "Michael", email: "michael@gmail.com", password: "michael")
      end
      it 'is rejected and redirect to root path' do
        visit user_path(User.first.id)
        expect(page).to have_content 'ログインもしくはアカウント登録してください。'
        visit new_user_session_path
        fill_in 'Eメール', with: 'michael@gmail.com'
        fill_in 'パスワード', with: 'michael'
        click_button 'ログイン'
        expect(page).to have_content 'ログインしました。'
      end
    end
    context 'when a existing user log in and log out' do
      before do
        User.create!(name: "Michael", email: "michael@gmail.com", password: "michael")
      end
      it 'is successfully working' do
        visit new_user_session_path
        fill_in 'Eメール', with: 'michael@gmail.com'
        fill_in 'パスワード', with: 'michael'
        click_button 'ログイン'
        expect(page).to have_content 'Cycle Depot'
        expect(page).to have_content 'ログインしました。'
        click_on 'ログアウト'
        expect(page).to have_content 'ログアウトしました。'
      end
    end
  end
  describe 'User access restriction' do
    context 'when user tries to access to admin only pages' do
      before do
        User.create!(name: "Michael", email: "michael@gmail.com", password: "michael")
        User.create!(name: "King", email: "king@gmail.com", password: "kingking", admin: true)
      end
      it 'only admin user is able to access to users_path' do
        visit root_path
        click_link 'ログイン'
        fill_in 'Eメール', with: 'michael@gmail.com'
        fill_in 'パスワード', with: 'michael'
        click_button 'ログイン'
        expect(page).to have_content 'ログインしました。'
        visit users_path
        expect(page).to have_content 'Cycle Depot'
        click_link 'ログアウト'
        click_link 'ログイン'
        fill_in 'Eメール', with: 'king@gmail.com'
        fill_in 'パスワード', with: 'kingking'
        click_button 'ログイン'
        visit users_path
        expect(page).to have_content 'ユーザー一覧'
      end
    end
    context 'when user tries to access to my page' do
      before do
        User.create!(name: "Michael", email: "michael@gmail.com", password: "michael")
        User.create!(name: "King", email: "king@gmail.com", password: "kingking", admin: true)
      end
      it 'the user is able to access to only my own page' do
        user = User.first
        user2 = User.second
        visit root_path
        click_link 'ログイン'
        fill_in 'Eメール', with: 'michael@gmail.com'
        fill_in 'パスワード', with: 'michael'
        click_button 'ログイン'
        visit user_path(user)
        expect(page).to have_content '保存したショップ'
        visit user_path(user2)
        expect(page).to have_content 'Cycle Depot'
      end
      it 'the user is able to access to only my own accout edit page' do
        user = User.first
        user2 = User.second
        visit root_path
        click_link 'ログイン'
        fill_in 'Eメール', with: 'michael@gmail.com'
        fill_in 'パスワード', with: 'michael'
        click_button 'ログイン'
        visit edit_user_path(user)
        expect(page).to have_content 'マイページ'
        visit user_path(user2)
        expect(page).to have_content 'Cycle Depot'
      end
    end
  end
  describe 'User like and save a shop' do
    before do
      Shop.create!(name: "ロードバイクカフェ", prefecture: "東京都", city: "渋谷区", address: "代々木1-1-1", latitude: "30.00000", longitude: "130.00000", business_hour: "24/7", cashless: true, bike_rack: false, remarks: "This is a chill spot")
      User.create!(name: "Michael", email: "michael@gmail.com", password: "michael")
      visit root_path
      click_link 'ログイン'
      fill_in 'Eメール', with: 'michael@gmail.com'
      fill_in 'パスワード', with: 'michael'
      click_button 'ログイン'
    end
    context 'when user like a shop', js: true do
      it 'The number of like of the shop increased' do
        find('.favorite-link').click
        sleep 0.5
        expect(page).to have_content '1'
      end
    end
    context 'when user save a shop', js: true do
      it 'The shop save by user is on my page of the user' do
        find('.saved-shop-link').click
        click_link 'マイページ'
        expect(page).to have_content 'ロードバイクカフェ'
      end
    end
  end
  describe 'User browsing histories function' do
    context 'when user browse a shop' do
      before do
        Shop.create!(name: "ロードバイクカフェ", prefecture: "東京都", city: "渋谷区", address: "代々木1-1-1", latitude: "30.00000", longitude: "130.00000", business_hour: "24/7", cashless: true, bike_rack: false, remarks: "This is a chill spot")
        User.create!(name: "Michael", email: "michael@gmail.com", password: "michael")
        visit root_path
        click_link 'ログイン'
        fill_in 'Eメール', with: 'michael@gmail.com'
        fill_in 'パスワード', with: 'michael'
        click_button 'ログイン'
      end
      it 'the user can see the shop on my page' do
        click_link 'マイページ'
        expect(page).not_to have_content 'ロードバイクカフェ'
        visit root_path
        visit shop_path(Shop.first.id)
        click_link 'マイページ'
        expect(page).to have_content 'ロードバイクカフェ'
      end
    end
  end
end
