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

class Cast < ApplicationRecord
  belongs_to :credit
end
