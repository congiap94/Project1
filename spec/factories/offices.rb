# frozen_string_literal: true

FactoryBot.define do
  factory :office do
    name { Faker::Address.city }
    address { Faker::Address.street_address }
  end
end
