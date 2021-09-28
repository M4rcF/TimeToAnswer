Rails.application.routes.draw do
  namespace :admins_w do
    get 'admins/index'
  end
  namespace :site do
    get 'welcome/index'
  end
  namespace :admins_w do
    get 'welcome/index'
  end
  namespace :users_w do
    get 'welcome/index'
  end
  devise_for :users
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'site/welcome#index'
end
