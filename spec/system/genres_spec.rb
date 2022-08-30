require 'rails_helper'

RSpec.describe "Genres", type: :system do
  describe 'Only admin access' do
    context 'When non admin user tries to access genres related page' do
      it 'is rejected' do
        user = User.create!(name: "Michael", email: "michael@gmail.com", password: "michael")
        visit root_path
        click_link 'ログイン'
        fill_in 'Eメール', with: 'michael@gmail.com'
        fill_in 'パスワード', with: 'michael'
        click_button 'ログイン'
        visit genres_path
        expect(page).not_to have_content 'ジャンル一覧'
        click_link 'ログアウト'
        admin_user = User.create!(name: "King", email: "king@gmail.com", password: "kingking", admin: true)
        visit root_path
        click_link 'ログイン'
        fill_in 'Eメール', with: 'king@gmail.com'
        fill_in 'パスワード', with: 'kingking'
        click_button 'ログイン'
        visit genres_path
        expect(page).to have_content 'ジャンル一覧'
      end
    end
  end
  describe 'Admin CRUD' do
    before do
      User.create!(name: "King", email: "king@gmail.com", password: "kingking", admin: true)
      visit root_path
      click_link 'ログイン'
      fill_in 'Eメール', with: 'king@gmail.com'
      fill_in 'パスワード', with: 'kingking'
      click_button 'ログイン'
    end
    context 'admin user is able to create, edit and delete genres' do
      it 'genres create' do
        click_link 'ジャンル一覧'
        click_link '新しいジャンルを作成する'
        click_button '作成する'
        expect(page).to have_content 'エラーが検出されました'
        fill_in 'ジャンル名', with: '喫茶店'
        click_button '作成する'
        click_link '新しいジャンルを作成する'
        fill_in 'ジャンル名', with: 'ベーカリー'
        click_button '作成する'
        expect(page).to have_content 'ジャンルが作成されました。'
        expect(page).to have_content '喫茶店'
      end
      it 'genres edit' do
        Genre.create!(name: "喫茶店")
        click_link 'ジャンル一覧'
        expect(page).to have_content '喫茶店'
        click_link '編集'
        fill_in 'ジャンル名', with: 'カフェ'
        click_button '更新する'
        expect(page).not_to have_content '喫茶店'
        expect(page).to have_content 'カフェ'
        expect(page).to have_content 'ジャンルが更新されました'
      end
      it 'genres delete' do
        Genre.create!(name: "喫茶店")
        click_link 'ジャンル一覧'
        click_link '削除'
        expect(page).not_to have_content '喫茶店'
        expect(page).to have_content 'ジャンルが削除されました。'
      end
    end
  end
end
