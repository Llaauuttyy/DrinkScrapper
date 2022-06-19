Rails.application.routes.draw do
  get '', to: "products#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/index", to: "products#index"
  get "/products", to: "products#index"
  get "/drinks_with_alcohol", to: "products#drinks_with_alcohol"
  get "/drinks_without_alcohol", to: "products#drinks_without_alcohol"
  get "/candies", to: "products#candies"
  get "/cereal_bars", to: "products#cereal_bars"
  get "/invalid_product", to: "products#invalid_product"
  # Defines the root path route ("/")
end
