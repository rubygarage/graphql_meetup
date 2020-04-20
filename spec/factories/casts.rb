# frozen_string_literal: true

# == Schema Information
#
# Table name: casts
#
#  id         :bigint           not null, primary key
#  first_name :string           not null
#  last_name  :string           not null
#  character  :string           not null
#  credit_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :cast do
    credit

    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    character { FFaker::Lorem.word.capitalize }
  end
end
