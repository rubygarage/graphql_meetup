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

class ListsMovie < ApplicationRecord
  belongs_to :movie
  belongs_to :list
end
