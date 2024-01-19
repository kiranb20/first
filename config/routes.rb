Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  resources:loginpage
  post 'create',to: 'adpage#create'
  post 'view', to: 'adpage#show'
  post 'users', to: 'adlogin#valid'
  get 'courses', to: 'courses#index'
  post 'update', to: 'adpage#update'
  get '/courses/:teacher_name', to: 'courses#show'

  get '/enrollments/:course_name', to: 'enrollments#show'
  get '/stdenroll', to: 'enrollments#showStudent'
  post '/enrollments/:student_name/:course_name/:marks', to: 'enrollments#update'
  get '/enrollments/enroll/:student_name/:course_name', to: 'enrollments#enroll'
  get '/enrollments/student/:student_name', to: 'enrollments#showStudent'
  post '/course/add', to: 'courses#add'

  get '/courses/index/all', to: 'courses#index'

  resources:articles, only: [:show, :index, :new, :create, :edit, :update]
end


