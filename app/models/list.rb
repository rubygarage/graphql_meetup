# frozen_string_literal: true

# == Schema Information
#
# Table name: lists
#
#  id              :bigint           not null, primary key
#  description     :string
#  name            :string           not null
#  user_account_id :bigint
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class List < ApplicationRecord
  belongs_to :user_account

  has_many :lists_movies, dependent: :destroy
  has_many :movies, through: :lists_movies
end
