# frozen_string_literal: true

module Types::Interfaces::NodeInterface
  include Types::Base::Interface

  graphql_name 'NodeInterface'

  description I18n.t('graphql.interfaces.node.desc')

  field :id, ID, null: false, description: I18n.t('graphql.interfaces.node.fields.id')
end
