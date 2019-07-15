Rails.application.routes.draw do
  get 'jobs/index'
  get 'jobs/show'
  get 'jobs/add'
  get 'jobs/edit'
  devise_for :users
  get 'scheduler/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "scheduler#index"
  get "jobs/add", to: "jobs#add", as: "add_job"
  get "jobs/:id", to: "jobs#show", as: "show_job"
  post "jobs", to: "jobs#create", as: "create_job"
  patch "jobs", to: "jobs#update", as: "update_job"
end
