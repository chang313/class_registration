Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#index"

  # user routes
  get "/user_view", to: "user#index"
  get "/user_view/:id", to: "user#show"
  get "/user_view/:id/20", to: "table#class_20"
  get "/user_view/:id/40", to: "table#class_40"
  get "/user_view/:id/20/:time_index", to: "table#show_tutor_20"
  get "/user_view/:id/40/:time_index", to: "table#show_tutor_40"
  get "/user_view/:id/20/:time_index/:tutor_nickname", to: "table#enroll_20"
  get "/user_view/:id/40/:time_index/:tutor_nickname", to: "table#enroll_40"
  
  # tutor routes
  get "/tutor_view", to: "tutor#index"
  get "/tutor_view/:id", to: "tutor#select"
  get "/tutor_view/:id/enroll", to: "tutor#enroll"
  get "/tutor_view/:id/available", to: "tutor#available"

end
