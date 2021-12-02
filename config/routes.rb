Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/meeting_room', to: 'meetingrooms#create'
    end
  end
end
