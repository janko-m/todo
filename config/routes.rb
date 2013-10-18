Todo::Application.routes.draw do
  root to: "tasks#index"

  controller :static_pages do
    get "api"
  end
end
