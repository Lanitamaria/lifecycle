Rails.application.routes.draw do
  resources :skills
  get 'company/index'
  get 'candidate/index'
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations',
        omniauth_callbacks: 'users/omniauth_callbacks',
        skills: 'skills/index'
      }
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'home/index'
  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
