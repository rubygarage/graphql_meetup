# frozen_string_literal: true

module List::Operation
  class Delete < Trailblazer::Operation
    step Model(List, :find_by)
    step :destroy!
    step :set_result

    def destroy!(_ctx, model:, **)
      model.destroy!
    end

    def set_result(ctx, model:, **)
      ctx['result'] = { deleted_list_id: model.id }
    end
  end
end
