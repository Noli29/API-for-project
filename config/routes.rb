Lalala::Application.routes.draw do

  get "messages/index"
  get "messages/show"
  get "messages/new"

  get "signout" => "sessions#destroy"
  get "signin" => "sessions#new"
  get "signup" => "users#new", :as => "signup"

  root to: "static_pages#home"


  namespace :api do
    resources :posts, except: [:new, :edit]
    resources :users, except: [:new, :edit]
    resources :messages, except: [:new, :edit]
  end

  resources :sessions
  resources :messages

end
