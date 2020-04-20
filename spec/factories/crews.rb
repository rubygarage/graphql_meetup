# frozen_string_literal: true

# == Schema Information
#
# Table name: crews
#
#  id         :bigint           not null, primary key
#  first_name :string           not null
#  last_name  :string           not null
#  department :string           not null
#  credit_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :crew do
    credit

    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    department { FFaker::Lorem.word.capitalize }
  end
end
