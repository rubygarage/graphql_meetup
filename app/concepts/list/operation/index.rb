# frozen_string_literal: true

module List::Operation
  class Index < Trailblazer::Operation
    step :set_result

    def set_result(ctx, **)
      ctx['result'] = ::List.all
    end
  end
end
