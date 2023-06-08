Rails.application.routes.draw do
  get "/about", to: "about#index", as: :about

  root to: "home#index"
end
