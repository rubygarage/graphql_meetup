# frozen_string_literal: true

if Rails.env.development?
  UserAccount.delete_all

  FactoryBot.create(:user_account, with_user_profile: true)
end
