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

class Movie < ApplicationRecord
  has_many :movie_images, dependent: :destroy

  has_one :credit, dependent: :destroy

  has_many :lists_movies, dependent: :destroy
  has_many :lists, through: :lists_movies
  has_one_attached :poster
end
