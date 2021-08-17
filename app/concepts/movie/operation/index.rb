# frozen_string_literal: true

module Movie::Operation
  class Index < Trailblazer::Operation
    step :set_result

    def set_result(ctx, filter: '', **)
      ctx['result'] = ::Movie.where('title ILIKE ?', "%#{filter}%")
    end
  end
end
