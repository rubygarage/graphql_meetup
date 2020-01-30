# frozen_string_literal: true

module Types
  class AuthTokenType < Base::Object
    graphql_name 'AuthTokenType'
    description I18n.t('graphql.types.auth_token.desc')

    field :csrf,
          String,
          null: false,
          description: I18n.t('graphql.types.auth_token.fields.csrf')

    field :access,
          String,
          null: false,
          description: I18n.t('graphql.types.auth_token.fields.access')

    field :refresh,
          String,
          null: false,
          description: I18n.t('graphql.types.auth_token.fields.refresh')
  end
end
