# frozen_string_literal: true

module Types
  class SignOutType < Base::Object
    graphql_name 'SignOutType'
    description I18n.t('graphql.types.sign_out.desc')

    field :completed,
          Boolean,
          null: true,
          description: I18n.t('graphql.mutations.user.sign_out.fields.completed')
  end
end
