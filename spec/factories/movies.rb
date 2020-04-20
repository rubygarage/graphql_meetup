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
#  runtime           :integer
#  original_language :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

FactoryBot.define do
  factory :movie do
    transient do
      with_movie_images { false }
      with_poster { false }
      with_credit { true }

      movie_images_count { 2 }
    end

    title { FFaker::Movie.title }
    original_title { FFaker::Movie.title }
    overview { FFaker::Lorem.paragraph }
    revenue { 10_000 + rand * 100_000_000 }
    budget { 10_000 + rand * 100_000_000 }
    runtime { (1 + rand).hour.to_i }
    original_language { FFaker::Locale.language }

    after(:create) do |movie, evaluator|
      if evaluator.with_movie_images
        movie.movie_images = create_list(:movie_image, evaluator.movie_images_count, movie: movie)
      end

      if evaluator.with_poster
        movie.poster.attach(
          io: File.open(Rails.root.join('spec', 'fixtures', "#{rand(1..4)}.jpg")),
          filename: 'poster.jpg'
        )
      end

      movie.credit = create(:credit, movie: movie) if evaluator.with_credit
    end
  end
end
