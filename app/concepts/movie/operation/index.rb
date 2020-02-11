# frozen_string_literal: true

module Movie::Operation
  class Index < Trailblazer::Operation
    step :set_result

    def set_result(ctx, **)
      ctx['result'] = ::Movie.all
    end
  end
end
