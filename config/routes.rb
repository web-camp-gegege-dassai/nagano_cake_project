Rails.application.routes.draw do
  devise_for :admin, controllers: {
    registrations: 'admin/registrations',
    sessions: 'admin/sessions'
  }


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: 'public' do
    root to: "homes#top"

    get "/about" => "homes#about"

    resources :items, only: [:index, :show]

    get "/customers/my_page" => "customers#show"
    get "/customers/edit" => "customers#edit"
    get "/customers/unsubscribe" => "customers#unsubscribe"
    
    resources :customers, only: [:edit, :update] do
      member do
        get 'unsubscribe'
        patch 'withdraw'
      end
    end

    resources :cart_items, only: [:index, :update, :destroy, :create] do
      collection do
        delete 'destroy_all'
      end
    end

    resources :orders, only: [:new, :create, :index, :show] do
      collection do
        post 'confirm'
        get 'complete'
      end
    end

    resources :addresses, except: [:show, :new]
  end
  
 devise_for :customers, controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

  namespace :admin do
    get "/" => "homes#top"

    resources :items, except: [:destroy]

    resources :genres, only: [:index, :create, :edit, :update]

    resources :customers, only: [:index, :show, :edit, :update]

    resources :orders, only: [:show, :update] do
      resources :order_details, only: [:update]
    end
  end

end
