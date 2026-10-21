
Rails.application.routes.draw do
    
    # Health check
    get "up" => "rails/health#show", as: :rails_health_check

    
    # Session
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"

    # Users
    get   "/users", to: "users#index"
post  "/users", to: "users#create"
get   "/users/search_by_role", to: "users#search_by_role"
get   "/users/", to: "users#show"
patch "/users/", to: "users#update"
patch "/users//change_password", to: "users#change_password"
  
    # Product
    get  "/products", to: "products#index"
post "/products", to: "products#create"


    # Product Categories
    get    "/product_categories", to: "product_categories#index"
post   "/product_categories", to: "product_categories#create"
patch  "/product_categories/", to: "product_categories#update"
delete "/product_categories/", to: "product_categories#destroy"


#test


end
