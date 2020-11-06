# frozen_string_literal: true

module List::Operation
  class Show < Trailblazer::Operation
    step Model(List, :find_by)
    step :set_result

    def set_result(ctx, model:, **)
      ctx['result'] = model
    end
  end
end
