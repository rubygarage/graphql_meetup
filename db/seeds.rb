# frozen_string_literal: true

if Rails.env.development?
  UserProfile.delete_all
  UserAccount.delete_all
  Movie.delete_all

  FactoryBot.create(
    :user_account,
    email: 'user@example.com',
    password: 'password',
    with_user_profile: true
  )

  FactoryBot.create_list(:movie, 10, with_poster: true, with_movie_images: true)
  FactoryBot.create_list(:movie, 10, with_poster: true)
  FactoryBot.create_list(:movie, 10)
end
