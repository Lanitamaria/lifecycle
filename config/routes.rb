Rails.application.routes.draw do
  get 'company/index'
  get 'candidate/index'
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'home/index'
  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
