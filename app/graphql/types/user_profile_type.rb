# frozen_string_literal: true

module Types
  class UserProfileType < Base::Object
    I18N_PATH = 'graphql.types.user_profile_type'

    graphql_name 'UserProfileType'
    implements Types::Interfaces::Node

    description I18n.t("#{I18N_PATH}.desc")

    field :first_name,
          String,
          null: false,
          description: I18n.t("#{I18N_PATH}.fields.first_name")

    field :last_name,
          String,
          null: false,
          description: I18n.t("#{I18N_PATH}.fields.last_name")

    field :full_name,
          String,
          null: false,
          description: I18n.t("#{I18N_PATH}.fields.full_name")

    field :avatar,
          Types::ImageType,
          null: false,
          description: I18n.t("#{I18N_PATH}.fields.avatar")
  end
end
