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
    transient do
      with_user_profile { false }
    end

    email { FFaker::Internet.unique.email }
    password { 'password' }

    after(:build) do |account, evaluator|
      account.user_profile = build(:user_profile, user_account: account) if evaluator.with_user_profile
    end
  end
end
