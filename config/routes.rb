Rails.application.routes.draw do

get '/clues/:location/:answer', to: 'clues#index'
get '/admin/new', to: 'clues#new'
post '/admin/create', to: 'clues#create'

end
