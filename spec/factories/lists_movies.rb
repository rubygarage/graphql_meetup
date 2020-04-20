# frozen_string_literal: true

# == Schema Information
#
# Table name: lists_movies
#
#  id         :bigint           not null, primary key
#  list_id    :bigint
#  movie_id   :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :lists_movie do
    list
    association :movie, with_poster: true
  end
end
