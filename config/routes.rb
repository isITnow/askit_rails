Rails.application.routes.draw do
  resource :session, only: %i[new create destroy]

  resources :users, except: %i[index show destroy]

  resources :questions do
    resources :answers, except: %i[show new]
  end
  
  root "pages#index"
end
