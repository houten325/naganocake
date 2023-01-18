Rails.application.routes.draw do
# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions",
  passwords: "admins/passwords",
}

namespace :admins do
 root to: 'sessions#new'
 resources :customers, only: [:index, :show, :edit, :update]
 resources :genres, only: [:index, :create, :edit, :update]
 resources :items, only: [:index, :new, :create, :show, :edit, :update]
 resources :orders, only: [:show, :update]
 resources :order_details, only: [:update]
 end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
