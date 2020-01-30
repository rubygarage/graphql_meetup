# frozen_string_literal: true

module UserAuth::Contract
  class SignUp < Reform::Form
    feature Reform::Form::Dry

    property :first_name, virtual: true
    property :last_name, virtual: true
    property :email
    property :password
    property :password_confirmation

    validation :default do
      configure do
        def unique_user_account_email?(email)
          !UserAccount.exists?(email: email)
        end
      end

      required(:first_name).filled(:str?, max_size?: Constants::STRING_MAX_LENGTH)
      required(:last_name).filled(:str?, max_size?: Constants::STRING_MAX_LENGTH)
      required(:email).filled(:str?, :unique_user_account_email?, max_size?: Constants::STRING_MAX_LENGTH,
                                                                  format?: URI::MailTo::EMAIL_REGEXP)
      required(:password).filled(:str?, min_size?: Constants::PASSWORD_MIN_LENGTH,
                                        max_size?: Constants::PASSWORD_MAX_LENGTH).confirmation
    end
  end
end
