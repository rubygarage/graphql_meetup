# frozen_string_literal: true

module UserAuth::Operation
  class SignIn < Trailblazer::Operation
    step Contract::Build(builder: :build_contract)
    step Contract::Validate()
    step :find_user_account
    step :check_credentials
    step :generate_auth_token

    def build_contract(_ctx, params:, **)
      UserAuth::Contract::SignIn.new(UserAccount, **params)
    end

    def find_user_account(ctx, params:, **)
      ctx['user_account'] = UserAccount.find_by(email: params[:email])
      Trailblazer::Activity::Right
    end

    def check_credentials(ctx, user_account:, params:, **)
      if user_account&.authenticate(params[:password])
        Trailblazer::Activity::Right
      else
        ctx['operation_status'] = :credentials_error
        ctx['contract.default'].errors.add :base, I18n.t('operations.auth.invalid_credentials')
        Trailblazer::Activity::Left
      end
    end

    def generate_auth_token(ctx, user_account:, **)
      session = Lib::Builders::JWTSessionBuilder.new.call(account_id: user_account.id)
      ctx['result'] = session.login
    end
  end
end
