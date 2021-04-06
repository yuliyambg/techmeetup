Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'login', to: 'session#new'
  post 'login', to: 'session#create'
  delete 'session', to: 'session#destroy'

  get 'meetups/search', to:'meetups#search'
  post 'meetups/search', to:'meetups#search'

  post 'meetups/:id/attend', to:'meetups#attend'

  resources :meetups do
    resources :comments
  end

  resources :users



end
