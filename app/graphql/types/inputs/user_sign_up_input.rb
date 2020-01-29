# frozen_string_literal: true

module Types
  module Inputs
    class UserSignUpInput < ::Types::Base::InputObject
      I18N_PATH = 'graphql.inputs.user.sign_up_input'

      graphql_name 'UserSignUpInput'

      description I18n.t("#{I18N_PATH}.desc")

      argument :first_name,
               String,
               required: true,
               description: I18n.t("#{I18N_PATH}.args.first_name"),
               prepare: ->(first_name, _ctx) { first_name.strip }

      argument :last_name,
               String,
               required: true,
               description: I18n.t("#{I18N_PATH}.args.last_name"),
               prepare: ->(last_name, _ctx) { last_name.strip }

      argument :email,
               String,
               required: true,
               description: I18n.t("#{I18N_PATH}.args.email"),
               prepare: ->(email, _ctx) { email.strip }

      argument :password,
               String,
               required: true,
               description: I18n.t("#{I18N_PATH}.args.password")

      argument :password_confirmation,
               String,
               required: true,
               description: I18n.t("#{I18N_PATH}.args.password_confirmation")
    end
  end
end
