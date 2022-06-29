Rails.application.routes.draw do
  get 'reviews/index/:plu', to: "reviews#index"
  post 'reviews/index/:plu', to: "reviews#upload"

  get '', to: "products#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/index", to: "products#index"

  post "/:section_name", to: "products#button"
  get "/:section_name", to: "products#filter_button"

  # Defines the root path route ("/")
end
