# frozen_string_literal: true

module Types
  class MovieType < Base::Object
    I18N_PATH = 'graphql.types.movie_type'

    graphql_name 'MovieType'
    implements Types::Interfaces::NodeInterface
    description I18n.t("#{I18N_PATH}.desc")

    field :title, String, null: false, description: I18n.t("#{I18N_PATH}.fields.title")
    field :original_title, String, null: true, description: I18n.t("#{I18N_PATH}.fields.original_title")
    field :overview, String, null: true, description: I18n.t("#{I18N_PATH}.fields.overview")
    field :revenue, Integer, null: true, description: I18n.t("#{I18N_PATH}.fields.revenue")
    field :budget, Integer, null: true, description: I18n.t("#{I18N_PATH}.fields.budget")
    field :runtime, Integer, null: true, description: I18n.t("#{I18N_PATH}.fields.runtime")
    field :original_language, String, null: true, description: I18n.t("#{I18N_PATH}.fields.original_language")

    field :images,
          [Types::MovieImageType],
          null: true,
          description: I18n.t("#{I18N_PATH}.fields.images")

    field :poster,
          Types::PosterType,
          null: true,
          description: I18n.t("#{I18N_PATH}.fields.poster")

    def images
      BatchLoader::GraphQL.for(object.id).batch(default_value: []) do |movie_ids, loader|
        ::MovieImage
          .with_attached_file
          .where(movie_id: movie_ids)
          .each do |movie_image|
            loader.call(movie_image.movie_id) { |memo| memo << movie_image.file }
          end
      end
    end

    def poster
      BatchLoader::GraphQL.for(object.id).batch do |record_ids, loader|
        ::ActiveStorage::Attachment.includes(:blob).where(
          record_id: record_ids,
          record_type: 'Movie'
        ).each do |attachment|
          loader.call(attachment.record_id, attachment)
        end
      end
    end
  end
end
