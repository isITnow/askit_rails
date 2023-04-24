Rails.application.routes.draw do
  resources :users, only: %i[new create]

  resources :questions do
    resources :answers, except: %i[show new]
  end
  
  root "pages#index"
end
