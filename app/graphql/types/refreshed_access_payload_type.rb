# frozen_string_literal: true

module Types
  class RefreshedAccessPayloadType < Base::Object
    I18N_PATH = 'graphql.types.refreshed_access_payload_type'

    graphql_name 'RefreshedAccessPayloadType'
    description I18n.t("#{I18N_PATH}.desc")

    field :csrf,
          String,
          null: false,
          description: I18n.t("#{I18N_PATH}.fields.csrf")

    field :access,
          String,
          null: false,
          description: I18n.t("#{I18N_PATH}.fields.access")

    field :access_expires_at,
          String,
          null: false,
          description: I18n.t("#{I18N_PATH}.fields.access_expires_at")
  end
end
