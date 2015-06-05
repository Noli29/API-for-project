Lalala::Application.routes.draw do

  get "signout" => "sessions#destroy"
  get "signin" => "sessions#new"
  get "signup" => "users#new", :as => "signup"

  root to: "static_pages#home"


  namespace :api do
    resources :posts, except: [:new, :edit]
    resources :users, except: [:new, :edit]
    resources :messages, except: [:edit, :update]
  end

  resources :sessions

end
