# frozen_string_literal: true

module Types
  class ImageType < Base::Object
    I18N_PATH = 'graphql.types.image_type'

    graphql_name 'ImageType'

    description I18n.t("#{I18N_PATH}.desc")

    field :id,
          String,
          null: false,
          description: I18n.t("#{I18N_PATH}.fields.id")

    field :filepath,
          String,
          null: true,
          description: I18n.t("#{I18N_PATH}.fields.filepath")

    def filepath
      return nil unless object.blob

      Rails.application.routes.url_helpers.rails_blob_url(object.blob)
    end

    def id
      object.blob.id
    end
  end
end
