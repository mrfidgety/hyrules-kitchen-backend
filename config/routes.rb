Rails.application.routes.draw do
  namespace :api, constraints: { format: :json } do
    namespace :v1 do
      resources :ingredients, only: %i[index show]
      resources :effects, only: %i[index show]
      resources :recipes, only: %i[create show]
    end
  end
end
