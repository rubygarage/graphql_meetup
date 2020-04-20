# frozen_string_literal: true

# == Schema Information
#
# Table name: credits
#
#  id         :bigint           not null, primary key
#  movie_id   :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Credit < ApplicationRecord
  belongs_to :movie

  has_many :casts, dependent: :destroy
  has_many :crews, dependent: :destroy
end
