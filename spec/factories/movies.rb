# frozen_string_literal: true

# == Schema Information
#
# Table name: movies
#
#  id                :bigint           not null, primary key
#  title             :string           not null
#  original_title    :string
#  overview          :string
#  revenue           :integer
#  budget            :integer
#  runtime           :string
#  original_language :string
#

FactoryBot.define do
  factory :movie do
    transient do
      with_movie_images { false }
      with_poster { false }

      movie_images_count { 2 }
    end

    title { FFaker::Movie.title }
    original_title { FFaker::Movie.title }
    overview { FFaker::Lorem.paragraph }
    revenue { 10_000 + rand * 100_000_000 }
    budget { 10_000 + rand * 100_000_000 }
    runtime { (1 + rand).hour.to_i }
    original_language { FFaker::Locale.language }

    after(:build) do |movie, evaluator|
      if evaluator.with_movie_images
        movie.movie_images = build_list(:movie_image, evaluator.movie_images_count, movie: movie)
      end

      if evaluator.with_poster
        movie.poster = Rack::Test::UploadedFile.new(
          Rails.root.join('spec', 'fixtures', "#{rand(1..4)}.jpg"),
          'image/png'
        )
      end
    end
  end
end
