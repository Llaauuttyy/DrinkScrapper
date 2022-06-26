Rails.application.routes.draw do
  get '', to: "products#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/index", to: "products#index"

  post "/:section_name", to: "products#button"
  get "/:section_name", to: "products#button"

  # Defines the root path route ("/")
end
