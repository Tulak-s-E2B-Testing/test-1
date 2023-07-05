Rails.application.routes.draw do
  resources :tenants do
    resources :translations
  end

  namespace :api do
    namespace :v1 do
      resources :tenants do
        resources :translations
      end
    end
  end

  root to: 'tenants#index'
end