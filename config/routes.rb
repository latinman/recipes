Rails.application.routes.draw do

  # get "/recipes" => "reciped#index"
  # get "/recipes/new" => "recipes#new", as: "new_recipe"
  # post "/recipes" => "recipes#create"
  # get "/recipes/:id/edit" => "recipes#edit", as: "edit_recipe"
  # patch "/recipes/:id" => "recipes#update"
  # get "/recipes/:id" => "recipes#show", as: "recipe"
  # delete "recipes/:id" => "recipes#destroy", as: "destroy_recipe"
  resources :recipes do
    member do
      post "like"
    end
  end

  resources :chefs, except: [:new, :destroy]
  get "/register" => "chefs#new"
  get "/login" => "logins#new"
  post "/login" => "logins#create"
  get "/logout" => "logins#destroy"
  resources :styles, only: [:new, :create, :show]
  resources :ingredients, only: [:new, :create, :show]
  root "pages#home"
end
