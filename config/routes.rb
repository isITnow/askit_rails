Rails.application.routes.draw do
  resources :questions do
    resources :answers, except: %i[show new]
  end
  
  root "pages#index"
end
