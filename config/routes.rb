Rails.application.routes.draw do
  resources :controversies, param: :slug, path: ''
  root "controversies#index"
end
