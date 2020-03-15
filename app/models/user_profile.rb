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

class UserProfile < ApplicationRecord
  belongs_to :user_account

  def full_name
    return nil if [first_name, last_name].all?(&:nil?)

    "#{first_name} #{last_name}"
  end
end
