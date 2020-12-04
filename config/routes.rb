Rails.application.routes.draw do
   devise_for :users,
                 path: "",
                 path_names: {
                   sign_in: "login",
                   sign_out: "logout",
                   sign_up: "sign_up"
                 },
                 controllers: {
                   confirmations: "devise/confirmations",
                 }
  resources :stuffs
  resources :show_users
  resources :categories, except: [:destroy]
  root to: "stuffs#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
