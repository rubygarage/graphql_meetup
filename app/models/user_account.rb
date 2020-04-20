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

class UserAccount < ApplicationRecord
  has_secure_password

  has_one :user_profile, dependent: :destroy

  has_many :favorite_movies, dependent: :destroy
  has_many :favorite_movies_list, through: :favorite_movies, source: :movie

  has_many :watchlist_movies, dependent: :destroy
  has_many :watchlist_movies_list, through: :watchlist_movies, source: :movie

  has_many :lists, dependent: :destroy
end
