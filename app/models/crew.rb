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

class Crew < ApplicationRecord
  belongs_to :credit
end
