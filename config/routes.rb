Rails.application.routes.draw do

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customer,skip: [:passwords,], controllers: {
    registrations: "customer/registrations",
    sessions: 'customer/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    
  namespace :admin do
    get 'homes/top'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :items
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end
  
  scope module: :customer do
    root 'homes#top'
    get 'homes/about'
    
    resource :customers, only: [:show, :edit, :update] do
      patch 'withdraw' => 'customers#withdraw', as: 'withdraw'
      get 'unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    end
    
    resources :items, only: [:index, :show]
    
    resources :cart_items, only: [:index, :create, :update, :destroy] do
      collection do
       delete 'destroy_all'
      end
    end
    
    resources :orders, only: [:index,  :show, :new, :create] do
      collection do
       post 'confirm' => 'orders#confirm'
       get 'complete' => 'orders#complete', as: 'complete'
      end
    end
    
    resources :addresses, only: [:index, :create, :edit, :update, :destroy]
    
  end
    
end
