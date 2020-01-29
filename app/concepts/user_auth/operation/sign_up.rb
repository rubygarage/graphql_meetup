# frozen_string_literal: true

module UserAuth::Operation
  class SignUp < Trailblazer::Operation
    step Model(UserAccount, :new)
    step Contract::Build()
    step Contract::Validate()

    step Wrap(Shared::Steps::ActiveRecordTransaction) {
      step Rescue(ActiveRecord::RecordInvalid, handler: :error_handler) {
        step Contract::Persist()
        step :create_profile!
      }, fail_fast: true
    }

    step :generate_auth_token

    def create_profile!(ctx, model:, params:, **)
      profile_params = params.slice(:first_name, :last_name).merge(id: model.id)

      model.create_user_profile!(profile_params)
    end

    def generate_auth_token(ctx, model:, **)
      session = Lib::Builders::JWTSessionBuilder.new.call(account_id: model.id)

      ctx['result'] = session.login
    end

    private

    def error_handler(exception, ctx)
      ctx['operation_status'] = :execution_error

      raise ActiveRecord::Rollback, exception.message
    end
  end
end
