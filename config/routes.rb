Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "tasks#index"
  resources :tasks do
    member do
     get :done
     get :not_yet
    end
  end

end
