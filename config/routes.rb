Rails.application.routes.draw do
  namespace :site do
    get 'welcome/index'
    get 'search', to: 'search#questions'
    get 'search/:subject_id/:subject_description', to: 'search#subject', as: 'search_subject'
    post 'answer', to: 'answer#question'
  end
  namespace :admins_w do
    get 'welcome/index'
    resources :admins, only: [:index, :edit, :update, :destroy, :new, :create]
    resources :subjects
    resources :questions
  end
  namespace :users_w do
    get 'welcome/index'
    get 'profile', to: 'profile#edit'
    patch 'profile', to: 'profile#update'
  end
  devise_for :users
  devise_for :admins, skip: [:registration]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'site/welcome#index'
end
