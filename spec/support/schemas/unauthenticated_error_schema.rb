# frozen_string_literal: true

UnauthenticatedErrorSchema = Dry::Validation.Schema do
  input :hash?

  required(:data)
  required(:errors).each do
    schema do
      required(:message).value(eql?: I18n.t('operations.auth.invalid_credentials'))
      optional(:locations).value(type?: Array).each(:hash?)
      optional(:extensions).value(type?: Array).each(:hash?)
      required(:extensions).schema do
        required(:code).value(eql?: 'UNAUTHENTICATED')
      end
      optional(:path).value(type?: Array).each(:str?)
    end
  end
end
