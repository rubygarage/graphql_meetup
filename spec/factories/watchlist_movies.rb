# frozen_string_literal: true

# == Schema Information
#
# Table name: watchlist_movies
#
#  id              :bigint           not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_account_id :bigint           not null
#  movie_id        :bigint           not null
#

FactoryBot.define do
  factory :watchlist_movie do
    user_account
    association :movie, with_poster: true
  end
end
