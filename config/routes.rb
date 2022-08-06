Rails.application.routes.draw do
  root 'shops#index'
  devise_for :users
  resources :users, :only => [:index, :show]
  resources :genres
  resources :shops
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
