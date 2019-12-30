Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :attendances
      resources :practices
      resources :skills
      resources :skaters
      resources :users
      resources :teams
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
