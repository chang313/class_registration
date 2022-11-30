Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#index" # root page

  # user routes
  get "/user_view", to: "user#index" # user selection page
  get "/user_view/:id", to: "user#show" # 20 min or 40 min selection page
  get "/user_view/:id/20", to: "table#class_20" # 20 min class available time table page
  get "/user_view/:id/40", to: "table#class_40" # 40 min class available time table page
  get "/user_view/:id/20/:time_index", to: "table#show_tutor_20" # selected time's available tutor list for 20 min
  get "/user_view/:id/40/:time_index", to: "table#show_tutor_40" # selected time's available tutor list for 40 min
  get "/user_view/:id/20/:time_index/:tutor_nickname", to: "table#enroll_20" # 20 min class enrollment done
  get "/user_view/:id/40/:time_index/:tutor_nickname", to: "table#enroll_40" # 40 min class enrollment done
  
  # tutor routes
  get "/tutor_view", to: "tutor#index" # tutor selection page
  get "/tutor_view/:id", to: "tutor#select" # 'enroll' or 'available' selection page
  get "/tutor_view/:id/enroll", to: "tutor#enroll" # enrolled class information list page
  get "/tutor_view/:id/available", to: "tutor#available" # available class time table page 

end
