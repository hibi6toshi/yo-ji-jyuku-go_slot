Rails.application.routes.draw do
  get 'static_pages/top'
  root 'static_pages#top'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :users, only: %i[new create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
