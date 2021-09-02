# frozen_string_literal: true

module List::Operation
  class Create < Trailblazer::Operation
    step :init_model
    step Contract::Build(constant: List::Contract::Create)
    step Contract::Validate(), fail_fast: true
    step Contract::Persist()
    step :set_result

    def init_model(ctx, **)
      ctx[:model] = List.new(user_account_id: ctx[:current_user].id)
    end

    def set_result(ctx, **)
      ctx['result'] = ctx[:current_user]
    end
  end
end
