# frozen_string_literal: true

module Types::Enums
  class Direction < ::Types::Base::Enum
    I18N_PATH = 'graphql.enums.order'

    description I18n.t("#{I18N_PATH}.desc")

    value 'DESC' do
      value 'desc'
      description I18n.t("#{I18N_PATH}.values.desc")
    end

    value 'ASC' do
      value 'asc'
      description I18n.t("#{I18N_PATH}.values.asc")
    end
  end
end
