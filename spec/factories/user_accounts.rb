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


FactoryBot.define do
  factory :user_account do
    email { FFaker::Internet.unique.email }
    password { 'password' }
  end
end
