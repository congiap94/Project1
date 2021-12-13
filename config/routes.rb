# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :offices, only: [] do
        resources :meeting_rooms, only: %i[create index]
      end
    end
  end
end
