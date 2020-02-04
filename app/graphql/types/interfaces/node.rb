# frozen_string_literal: true

module Types::Interfaces::Node
  include Types::Base::Interface

  graphql_name 'Node'

  description I18n.t('graphql.interfaces.node.desc')

  field :id, ID, null: false, description: I18n.t('graphql.interfaces.node.fields.id')
end
