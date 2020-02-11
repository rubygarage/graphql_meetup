# frozen_string_literal: true

NotFoundSchema = Dry::Validation.Schema do
  input :hash?

  required(:data)
  required(:errors).each do
    schema do
      required(:message).value(eql?: I18n.t('graphql.errors.messages.not_found'))
      optional(:locations).value(type?: Array).each(:hash?)
      optional(:path).value(type?: Array).each(:str?)
    end
  end
end
