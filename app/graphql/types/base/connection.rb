# frozen_string_literal: true

module Types::Base
  class Connection < GraphQL::Types::Relay::BaseConnection
    field :node_ids, [ID], I18n.t('graphql.types.connection_base_type.node_ids'), null: false
    def node_ids
      object.nodes.pluck(:id)
    end

    field :total_count, Int, I18n.t('graphql.types.connection_base_type.total_count'), null: false
    def total_count
      nodes_count
    end

    field :current_page, Int, I18n.t('graphql.types.connection_base_type.current_page'), null: false
    def current_page # rubocop:disable Metrics/AbcSize
      if object.arguments[:first] && object.arguments[:after]
        total = object.nodes.size
        limit = object.arguments[:first]
        offset = Base64.decode64(object.arguments[:after]).to_i

        offset >= total ? -1 : (offset / limit) + 1
      else
        1
      end
    end

    field :total_page_count, Int, I18n.t('graphql.types.connection_base_type.total_page_count'), null: false
    def total_page_count # rubocop:disable Metrics/AbcSize
      return 1 unless object.nodes&.any?

      my_total_count = nodes_count
      possible_page_sizes = [my_total_count]

      possible_page_sizes.push(object.arguments[:first]) if object.arguments[:first]
      possible_page_sizes.push(object.arguments[:last]) if object.arguments[:last]

      actual_page_size = possible_page_sizes.min

      (my_total_count / actual_page_size.to_f).ceil
    end

    private

    # Trick to handle correct nodes count after grouped scope
    def nodes_count
      nodes_count = object.nodes.size

      nodes_count.is_a?(Enumerable) ? nodes_count.size : nodes_count
    end
  end
end
