Rails.application.routes.draw do
  devise_for :admins, controllers: {
	  sessions:      'admins/sessions',
	  passwords:     'admins/passwords',
	  registrations: 'admins/registrations'
	}
	devise_for :users, controllers: {
	  sessions:      'users/sessions',
	  passwords:     'users/passwords',
	  registrations: 'users/registrations'
	}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #common
  resources :homes, only: [:index]

  #user
  resources :users
  get 'users/:id/password/edit' => 'users#password_edit', as: 'edit_password'
  patch 'users/:id/password' => 'users#password_update'

  #admin
  resources :admins
  get 'admin/users' => 'admins#user_index', as:'admin_users'

  #task_group
  resources :task_groups

  #task
  resources :tasks
  get 'tasks/:id/clear' => 'tasks#check'

  #diary
  resources :diaries

end
