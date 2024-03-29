Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
        resources :stores, only: [:index, :show], :defaults => { :format => 'json' }
        resources :ratings, only: [:create], :defaults => { :format => 'json' }
        resources :products, only: [:show], :defaults => { :format => 'json' }
    end
  end
end
