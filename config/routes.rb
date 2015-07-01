Lalala::Application.routes.draw do

  root to: "static_pages#home"

  get "signout" => "sessions#destroy"
  get "signin" => "sessions#new"
  get "signup" => "users#new", :as => "signup"


  namespace :api do
    resources :posts, except: [:new, :edit]
    resources :users, except: [:new, :edit]
    resources :messages, except: [:edit, :update]
    resources :sessions, except: [:edit, :update, :new, :show]
  end


end
