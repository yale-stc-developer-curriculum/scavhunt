Rails.application.routes.draw do

  resources :teams

get '/clues/:location/:answer', to: 'clues#index'
get '/admin/new', to: 'clues#new'
post '/admin/create', to: 'clues#create'
get '/admin/edit/:number', to: 'clues#edit'
patch '/admin/update', to: 'clues#update'
get '/admin/all', to: 'clues#all'
post '/correct', to: 'clues#correct'
end
