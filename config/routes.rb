Rails.application.routes.draw do
  #get 'gossips/new', to:'gossips#new'

  root to:'gossips#index'

  resources :gossips

  #root to:'gossips#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
