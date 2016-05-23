Rails.application.routes.draw do

  resources :photos
  resources :users do
    resources :albums
  end

end