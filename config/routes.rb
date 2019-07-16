Rails.application.routes.draw do
  get 'employees/add'
  get 'employees/delete'
  get 'jobs/index'
  get 'jobs/show'
  get 'jobs/add'
  get 'jobs/edit'
  devise_for :users
  get 'scheduler/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "scheduler#index"

  get "employees/add", to: "employees#add", as: "add_new_employee"
  post "employee", to: "employees#create", as: "create_employee"
  delete "employees/:id", to: "employees#delete", as: "delete_employee"

  get "jobs/add", to: "jobs#add", as: "add_job"
  delete "jobs/:id", to: "jobs#delete", as: "remove_job"
  get "jobs/:id", to: "jobs#show", as: "show_job"
  post "jobs", to: "jobs#create", as: "create_job"
  patch "jobs/update_job", to: "jobs#update", as: "update_job"
  patch "jobs/add_employee", to: "jobs#add_employee", as: "add_employee"
  patch "jobs/mark_job_completed", to: "jobs#mark_job_completed", as: "mark_job_completed"
end
