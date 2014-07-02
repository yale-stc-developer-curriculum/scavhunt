Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
        get '/clues/:location/:answer', to: 'clues#respond'
    end
  end

end
