Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'categories#index'

  devise_for :users, controllers: { sessions: 'users/sessions' }
  
  resources :categories, only: :show

  resources :titles do
    resources :tweaks do
      resources :descriptions do
        put :upvote
        put :downvote
      end
    end
  end
end
