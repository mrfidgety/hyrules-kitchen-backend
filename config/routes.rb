Rails.application.routes.draw do
  namespace :api, constraints: { format: :json } do
    namespace :v1 do
      resources :ingredients, only: %i[index show]
    end
  end
end
