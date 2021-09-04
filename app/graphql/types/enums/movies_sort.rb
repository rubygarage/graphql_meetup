# frozen_string_literal: true

module Types::Enums
  class MoviesSort < ::Types::Base::Enum
    I18N_PATH = 'graphql.enums.movies_sort'

    description I18n.t("#{I18N_PATH}.desc")

    value 'TITLE' do
      value 'title'
      description I18n.t("#{I18N_PATH}.values.title")
    end
  end
end
