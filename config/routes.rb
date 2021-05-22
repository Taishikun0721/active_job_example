Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  if Rails.env.development?
    require 'sidekiq/web'
    require 'sidekiq/cron/web'
    mount Sidekiq::Web => '/sidekiq'
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root 'home#show'
  resource :welcomes, only: %i[create]
  resources :users, only: %i[index]

  namespace :exports, constraints: { format: :csv } do
    resources :users, only: %i[index], controller: :user_informations
  end
end
