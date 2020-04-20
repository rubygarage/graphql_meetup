# frozen_string_literal: true

# == Schema Information
#
# Table name: user_accounts
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

FactoryBot.define do
  factory :user_account do
    transient do
      with_user_profile { false }

      with_custom_lists { false }
      custom_lists_count { 1 }
      movies_per_list_count { 2 }

      with_favorite_movies { false }
      favorite_movies_count { 2 }

      with_watchlist_movies { false }
      watchlist_movies_count { 2 }
    end

    email { FFaker::Internet.unique.email }
    password { 'password' }

    after(:create) do |account, evaluator|
      account.user_profile = create(:user_profile, user_account: account) if evaluator.with_user_profile

      if evaluator.with_custom_lists
        create_list(
          :list,
          evaluator.custom_lists_count,
          user_account: account,
          movies_count: evaluator.movies_per_list_count
        )
      end

      if evaluator.with_favorite_movies
        create_list(:favorite_movie, evaluator.favorite_movies_count, user_account: account)
      end

      if evaluator.with_watchlist_movies
        create_list(:watchlist_movie, evaluator.watchlist_movies_count, user_account: account)
      end
    end
  end
end
