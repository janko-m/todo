Todo::Application.routes.draw do
  root to: "tasks#index"

  controller :sessions do
    get "login", to: :new, as: :login
    post "login", to: :create
    delete "logout", to: :destroy, as: :logout
  end

  controller :registrations do
    get "register", to: :new, as: :register
    post "register", to: :create
  end

  resources :tasks

  controller :static_pages do
    get "api"
  end

  namespace :api do
    resources :tasks
  end
end
