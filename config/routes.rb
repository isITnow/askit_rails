# frozen_string_literal: true

Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    resource :session, only: %i[new create destroy]

    resources :users, except: %i[index show destroy]

    resources :questions do
      resources :answers, except: %i[show new]

      resources :comments, only: %i[create destroy]
    end

    resources :answers do
      resources :comments, only: %i[create destroy]
    end

    namespace :admin do
      resources :users, only: %i[index create edit update destroy]
    end

    root 'pages#index'
  end
end
