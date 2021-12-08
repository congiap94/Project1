# frozen_string_literal: true

FactoryBot.define do
  factory :meeting_room do
    name { Faker::Name.name }
    office_id { rand(1..99) }
    user_id { rand(1..99) }
    seat { rand(1..99) }
  end
end
