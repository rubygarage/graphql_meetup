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

class Movie < ApplicationRecord
  has_many :movie_images, dependent: :destroy

  has_one_attached :poster
end
