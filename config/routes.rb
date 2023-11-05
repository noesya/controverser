Rails.application.routes.draw do
  resources :controversies
  root "controversies#index"
end
