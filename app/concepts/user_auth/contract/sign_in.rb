# frozen_string_literal: true

module UserAuth::Contract
  class SignIn < Reform::Form
    feature Reform::Form::Dry

    property :email, virtual: true
    property :password, virtual: true

    validation :default do
      required(:email).filled(
        :str?, max_size?: Constants::STRING_MAX_LENGTH,
               format?: URI::MailTo::EMAIL_REGEXP
      )

      required(:password).filled(
        :str?, min_size?: Constants::PASSWORD_MIN_LENGTH,
               max_size?: Constants::PASSWORD_MAX_LENGTH
      )
    end
  end
end
