Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :meeting_rooms, only: [:create]
    end
  end
end
