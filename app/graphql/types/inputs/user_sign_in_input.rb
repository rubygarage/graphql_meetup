# frozen_string_literal: true

module Types
  module Inputs
    class UserSignInInput < ::Types::Base::InputObject
      I18N_PATH = 'graphql.inputs.user.sign_in_input'

      graphql_name 'UserSignInInput'

      description I18n.t("#{I18N_PATH}.desc")

      argument :email,
               String,
               required: true,
               description: I18n.t("#{I18N_PATH}.args.email"),
               prepare: ->(email, _ctx) { email.strip }

      argument :password,
               String,
               required: true,
               description: I18n.t("#{I18N_PATH}.args.password")

    end
  end
end
