Rails.application.routes.draw do
  root to: 'customer/products#index'
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    registrations: 'customers/registrations'
  }
  namespace :admin do
    resources :arrivals, only: [ :index, :new, :create ], shallow: true
    resources :artists, only: [ :index, :new, :create, :edit, :update, :destroy ], shallow: true
    resources :customers, only: [ :index, :show, :create, :edit, :destroy ], shallow: true
    resources :labels, only: [ :index, :new, :create, :edit, :update, :destroy ], shallow: true
    resources :orders, only: [ :index, :show, :update ], shallow: true
    get 'admin/customers/:customer_id/orders', to: 'orders#user_index', as: 'admin_user_orders'
    resources :products, shallow: true
    resources :reviews, only: [ :index, :edit, :update, :destroy ], shallow: true
  end
  resources :cart_items, only: [:index, :create, :update, :destroy], shallow: true
  resources :customers, only: [:show, :edit, :update], shallow: true
  get 'customers/leave', to: 'customers#leave_page', as: 'customer_leave_page'
  patch 'customers/leave', to: 'customers#leave', as: 'customer_leave'
  resources :destinations, only: [ :new, :create, :edit, :update], shallow: true
  resources :favorites, only: [:index, :create, :destroy], shallow: true
  resources :orders, only: [:index, :new, :create, :show], shallow: true
  post 'orders/new', to: 'orders#confirm_payment', as: 'confirm_payment'
  post 'orders/new/confirm', to: 'orders#confirm_order', as: 'confirm_order'
  resources :products, only: [:index, :show ], shallow: true
  resources :reviews, only: [:index, :new, :create], shallow: true

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
