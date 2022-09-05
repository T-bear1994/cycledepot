Rails.application.routes.draw do
  root 'shops#index'
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
    post 'users/admin_sign_in', to: 'users/sessions#new_admin'
  end
  resources :users, :only => [:index, :show, :edit, :update, :destroy]
  resources :genres, :except => [:show]
  resources :shops do
    resource :favorites, only: [:create, :destroy]
    resource :saved_shops, only: [:create, :destroy]
  end
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  get '*path', to: 'application#render_404'
end
