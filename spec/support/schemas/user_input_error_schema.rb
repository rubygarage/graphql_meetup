# frozen_string_literal: true

UserInputErrorSchema = Dry::Validation.Schema do
  input :hash?

  required(:data)
  required(:errors).each do
    schema do
      required(:message).value(eql?: I18n.t('graphql.errors.messages.user_input'))
      optional(:locations).value(type?: Array).each(:hash?)
      optional(:extensions).value(type?: Array).each(:hash?)
      required(:extensions).schema do
        required(:code).value(eql?: 'USER_INPUT_ERROR')
      end
      optional(:path).value(type?: Array).each(:str?)
    end
  end
end
