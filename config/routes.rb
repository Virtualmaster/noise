Rails.application.routes.draw do
  resources :noise_levels
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htm
  root to: "noise_levels#index"
end
