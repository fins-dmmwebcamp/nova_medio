Rails.application.routes.draw do
  namespace :admin do
    get 'genres/index'
    get 'genres/new'
    get 'genres/edit'
    get 'genres/create'
    get 'genres/update'
    get 'genres/destroy'
  end
  root to: 'products#index'
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
    resources :customers, only: [ :index, :show, :create, :edit, :destroy ] do
      resources :reviews, only: [ :index, :edit, :update, :destroy ], shallow: true
    end
    resources :labels, only: [ :index, :new, :create, :edit, :update, :destroy ], shallow: true
    resources :genres, only: [ :index, :new, :create, :edit, :update, :destroy ], shallow: true
    resources :orders, only: [ :index, :show, :update ], shallow: true
    get 'admin/customers/:customer_id/orders', to: 'orders#user_index', as: 'admin_user_orders'
    resources :products, shallow: true
  end
  resources :cart_items, only: [:index, :create, :update, :destroy], shallow: true
  resources :customers, only: [:show, :edit, :update] do
    resources :reviews, only: [:index], shallow: true
  end
  get 'customers/leave', to: 'customers#leave_page', as: 'customer_leave_page'
  patch 'customers/leave', to: 'customers#leave', as: 'customer_leave'
  resources :destinations, only: [ :new, :create, :edit, :update], shallow: true
  resources :orders, only: [:index, :new, :create, :show], shallow: true
  post 'orders/new', to: 'orders#confirm_payment', as: 'confirm_payment'
  post 'orders/new/confirm', to: 'orders#confirm_order', as: 'confirm_order'
  resources :products, only: [:index, :show ] do
    resources :reviews, only: [:new, :create]
    resources :favorites, only: [:create, :destroy], shallow: true
  end
  get 'favorites', to: 'favorites#index', as: 'favorites'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
