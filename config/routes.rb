Rails.application.routes.draw do
  get 'sessions/new'

  namespace :api do
    namespace :v1 do
      resources :attendances
      resources :practices
      resources :skills
      resources :skaters
      resources :users
      resources :teams

      # route to display just skaters that have not been accepted yet(ready for assessment)
      get 'assessment/:team_id', to: 'skaters#assessment_list'

      # route to display just the skaters that have been accepted(team roster)
      get 'roster/:team_id', to: 'skaters#roster_list'

      # route to display just the practices from an specific team
      get 'practicelist/:team_id', to: 'practices#list'

    end
  end

  resource :session, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
