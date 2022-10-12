Rails.application.routes.draw do

  namespace :admin do
    get 'orders/index'
    get 'orders/show'
  end
  namespace :public do
    get 'orders/new'
    get 'orders/confirm'
    get 'orders/complete'
    get 'orders/show'
  end
  namespace :admin do
    get 'cart_items/index'
  end
  namespace :public do
    get 'cart_items/index'
  end
  namespace :admin do
    get 'addresses/index'
    get 'addresses/edit'
  end
  namespace :public do
    get 'addresses/index'
    get 'addresses/edit'
  end
  get 'addresses/index'
  get 'addresses/edit'
  root to: "public/homes#top"
  get "home/about"=>"public/homes#about",as: "about"

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
   sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
