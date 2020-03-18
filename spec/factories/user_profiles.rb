# frozen_string_literal: true

# == Schema Information
#
# Table name: user_profiles
#
#  id              :bigint           not null, primary key
#  first_name      :string           not null
#  last_name       :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_account_id :bigint           not null
#

FactoryBot.define do
  factory :user_profile do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    association :user_account, with_user_profile: false
  end
end
