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

FactoryBot.define do
  factory :credit do
    transient do
      with_cast { true }
      cast_count { 5 }

      with_crew { true }
      crew_count { 5 }
    end

    association :movie, with_credit: false

    after(:create) do |credit, evaluator|
      credit.casts = create_list(:cast, evaluator.cast_count, credit: credit) if evaluator.with_cast

      credit.crews = create_list(:crew, evaluator.crew_count, credit: credit) if evaluator.with_cast
    end
  end
end
