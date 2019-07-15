Rails.application.routes.draw do
  devise_for :users
  get 'scheduler/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "scheduler#index"
end
