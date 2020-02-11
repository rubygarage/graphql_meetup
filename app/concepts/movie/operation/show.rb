# frozen_string_literal: true

module Movie::Operation
  class Show < Trailblazer::Operation
    step Model(Movie, :find_by)
    step :set_result

    def model(ctx, params:, **)
      ctx[:model] = Movie.find_by(id: params[:id])
    end

    def set_result(ctx, model:, **)
      ctx['result'] = model
    end
  end
end
