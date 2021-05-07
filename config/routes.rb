Rails.application.routes.draw do
  devise_for :users
  
  resources :scenarios do
    resources :scenes
  end
  root 'scenarios#index'
end
