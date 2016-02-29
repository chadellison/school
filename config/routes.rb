Rails.application.routes.draw do
  root "teachers#index"

  resources :teachers, only: [:index, :new, :create, :show]
end
