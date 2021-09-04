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
          connection: true do
            argument :order_by, Types::Inputs::MovieOrderingInput,
                     required: false, prepare: ->(order_by, _ctx) { order_by.to_h }
          end

    field :watchlist_movies_list,
          Types::Connections::MovieConnection,
          null: true,
          description: I18n.t("#{I18N_PATH}.fields.watchlist_movies_list"),
          connection: true

    def lists
      BatchLoader::GraphQL.for(object.id).batch(default_value: []) do |ids, loader|
        ::List.where(user_account_id: ids).each do |list|
          loader.call(list.user_account_id) { |memo| memo << list }
        end
      end
    end

    def favorite_movies_list(order_by: nil)
      BatchLoader::GraphQL.for(object.id).batch(default_value: []) do |ids, loader|
        ::FavoriteMovie.where(user_account_id: ids).includes(:movie).joins(:movie)
                       .order("movies.#{order_by[:sort]} #{order_by[:direction]}").each do |movie|
          loader.call(movie.user_account_id) { |memo| memo << movie.movie }
        end
      end
    end

    def watchlist_movies_list
      BatchLoader::GraphQL.for(object.id).batch(default_value: []) do |ids, loader|
        ::WatchlistMovie.where(user_account_id: ids).includes(:movie).joins(:movie).each do |movie|
          loader.call(movie.user_account_id) { |memo| memo << movie.movie }
        end
      end
    end
  end
end
