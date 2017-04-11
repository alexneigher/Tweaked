Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'categories#index'

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
