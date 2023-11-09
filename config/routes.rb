Rails.application.routes.draw do
  resources :controversies, param: :slug, path: '' do
    resources :fragments, param: :slug
    resources :concepts, param: :slug
  end
  root "controversies#index"
end
