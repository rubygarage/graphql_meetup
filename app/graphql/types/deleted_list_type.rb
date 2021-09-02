# frozen_string_literal: true

module Types
  class DeletedListType < Base::Object
    I18N_PATH = 'graphql.types.deleted_list_type'

    graphql_name 'DeletedListType'

    description I18n.t("#{I18N_PATH}.desc")

    field :deleted_list_id,
          String,
          null: false,
          description: I18n.t("#{I18N_PATH}.fields.deleted_list_id")
  end
end
