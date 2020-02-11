# frozen_string_literal: true

module Types::Interfaces::ImageInterface
  include Types::Base::Interface

  graphql_name 'ImageInterface'

  I18N_PATH = 'graphql.interfaces.image_interface'

  description I18n.t("#{I18N_PATH}.desc")

  field :file_path, String, null: true, description: I18n.t("#{I18N_PATH}.fields.file_path")

  def file_path
    return nil unless object.blob

    Rails.application.routes.url_helpers.rails_blob_url(object.blob)
  end
end
