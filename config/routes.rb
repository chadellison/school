Rails.application.routes.draw do
  root "teachers#index"

  resources :teachers, only: [:new, :create, :show]
end
