# frozen_string_literal: true

FactoryBot.define do
  factory :movie do
    title { FFaker::Movie.title }
    original_title { FFaker::Movie.title }
    overview { FFaker::Lorem.paragraph }
    revenue { 10000 + rand * 100000000 }
    budget { 10000 + rand * 100000000 }
    runtime { }
    original_language
    email { FFaker::Internet.unique.email }
  end
end
