# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    sequence(:title) { |n| "Title #{n}" }
    city Faker::Address.city
    organiser Faker::Name.name
    web Faker::Internet.url
  end
end
