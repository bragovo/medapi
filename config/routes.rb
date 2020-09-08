Rails.application.routes.draw do
  root 'pages#index'

  namespace :api, constraints: ->(req) { req.format == :json } do
    namespace :v1 do
      resources :procedures, only: :index
    end
  end
end
