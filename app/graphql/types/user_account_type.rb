# frozen_string_literal: true

module Types
  class UserAccountType < Base::Object
    I18N_PATH = 'graphql.types.user_account_type'

    graphql_name 'UserAccountType'

    implements Types::Interfaces::Node

    description I18n.t("#{I18N_PATH}.desc")

    field :email,
          String,
          null: false,
          description: I18n.t("#{I18N_PATH}.fields.email")

    field :user_profile,
          Types::UserProfileType,
          null: true,
          description: I18n.t("#{I18N_PATH}.fields.user_profile")

    field :lists,
          Types::Connections::ListConnection,
          null: true,
          description: I18n.t("#{I18N_PATH}.fields.lists"),
          connection: true

    field :favorite_movies_list,
          Types::Connections::MovieConnection,
          null: true,
          description: I18n.t("#{I18N_PATH}.fields.favorite_movies_list"),
          connection: true

    field :watchlist_movies_list,
          Types::Connections::MovieConnection,
          null: true,
          description: I18n.t("#{I18N_PATH}.fields.watchlist_movies_list"),
          connection: true
  end
end
