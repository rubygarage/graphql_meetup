# frozen_string_literal: true

class MovieImage < ApplicationRecord
  belongs_to :movie

  has_one_attached :file
end
