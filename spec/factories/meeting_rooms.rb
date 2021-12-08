# frozen_string_literal: true

FactoryBot.define do
  factory :meeting_room do
    name { 'MyString' }
    office_id { 1 }
    user_id { 1 }
    seat { 1 }
  end
end
