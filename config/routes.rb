Rails.application.routes.draw do

  root to: "public/homes#top"
  get "home/about"=>"public/homes#about",as: "about"


  # 顧客登録,login
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # customers ★
  scope module: :public do
    resource :customers, only: [:show] do
    get 'information/edit' => 'customers#edit'
    patch 'information' => 'customer#update'
    get 'confirm'
    patch 'withdraw'=>'customers#withdrow'

      delete 'cart_items/destroy_all'
      resources :cart_items, only: [:index, :create, :update, :destroy]

    end

    resources :items, only: [:index, :show]

    # orders
    post 'orders/confirm'
    get 'orders/complete'
    resources :orders, only: [:new, :create, :show, :index]

    # deliveries
    resources :address, only: [:index, :edit, :create, :update, :destroy]

  end

  # admin login~
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
   sessions: "admin/sessions"
  }

  namespace :admin do
    root to: 'homes#top'
  end

  # admin items
  namespace :admin do
    resources :items, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  end

  # admin genres
  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
  end

  # admin cutomers
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
  end

  # admin orders
  namespace :admin do
    resources :orders, only: [:index, :update, :show,]
  end

  # admon order_detail
  namespace :admin do
    resources :order_details, only: [:update]
  end









  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
