Rails.application.routes.draw do

  resources :users do
    resources :albums do
      resources :photos
    end
  end
end