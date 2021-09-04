# frozen_string_literal: true

module Types
  module Inputs
    class MovieOrderingInput < ::Types::Base::InputObject
      I18N_PATH = 'graphql.inputs.user.movie_ordering_input'

      graphql_name 'MovieOrderingInput'

      description I18n.t("#{I18N_PATH}.desc")

      argument :sort,
               Types::Enums::MoviesSort,
               required: true,
               description: I18n.t("#{I18N_PATH}.args.sort")

      argument :direction,
               Types::Enums::Direction,
               required: false,
               description: I18n.t("#{I18N_PATH}.args.direction"),
               default_value: Types::Enums::Direction.values['ASC'].value
    end
  end
end
