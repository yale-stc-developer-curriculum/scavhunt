Rails.application.routes.draw do

get '/clues/:location/:answer', to: 'clues#index'


end
