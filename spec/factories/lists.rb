# frozen_string_literal: true

# == Schema Information
#
# Table name: lists
#
#  id              :bigint           not null, primary key
#  description     :string
#  name            :string           not null
#  user_account_id :bigint
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

FactoryBot.define do
  factory :list do
    transient do
      movies_count { 2 }
    end

    description { FFaker::Lorem.sentence }
    name { FFaker::Lorem.word }

    user_account

    after(:create) do |list, evaluator|
      create_list(:lists_movie, evaluator.movies_count, list: list)
    end
  end
end
