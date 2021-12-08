# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    gender { 1 }
    phone { Faker::PhoneNumber.cell_phone_in_e164 }
    office_id { 1 }
  end
end
