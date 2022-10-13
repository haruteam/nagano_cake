Rails.application.routes.draw do
  root to: "public/homes#top"
  get "home/about"=>"public/homes#about",as: "about"
  # public items
  resources :items, only: [:index, :show]
  
  # 顧客登録,login
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  # customers ★
  resource :customers, only: [:show, :edit, :update]
  get 'customers/confirm'
  put '/customers'=>'customers#withdrow'
  
  # cart_items
  resources :cart_items, only: [:index, :create, :update, :destroy]
  delete 'cart_items/destroy_all'
  
  # orders
  resources :orders, only: [:new, :create, :show, :index]
  get 'orders/confirm'
  get 'orders/complete'
  
  # deliveries
  resources :deliveries, only: [:index, :edit, :create, :update, :destroy]
  
  # admin login~
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
   sessions: "admin/sessions"
  }
  
  # admin items
  namespace :admin do
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
  end
  
  # admin genres
  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
  end
  
  # admin cutomers
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
  end
  
  # admin orders
  namespace :admin do
    resources :orders, only: [:update, :show]
  end
  
  # admon order_detail
  namespace :admin do
    resources :order_details, only: [:update]
  end
  
  
 
  



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
