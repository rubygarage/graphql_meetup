# frozen_string_literal: true

module List::Operation
  class AddItem < Trailblazer::Operation
    step :movie_exists?
    fail :movie_not_found!, fail_fast: true
    step :init_model
    fail :list_not_found!, fail_fast: true
    step Contract::Build(constant: List::Contract::AddItem)
    step Contract::Validate(), fail_fast: true
    step :already_added?
    fail :duplicate!

    step Rescue(ActiveRecord::RecordInvalid, handler: :error_handler) {
      step :create_list_item!
    }

    step :set_result

    def movie_exists?(_ctx, params:, **)
      Movie.exists?(id: params[:movie_id])
    end

    def init_model(ctx, params:, **)
      ctx['model'] = List.find_by(id: params[:list_id])
    end

    def already_added?(_ctx, params:, **)
      !ListsMovie.exists?(movie_id: params[:movie_id], list_id: params[:list_id])
    end

    def create_list_item!(_ctx, params:, **)
      ListsMovie.create!(movie_id: params[:movie_id], list_id: params[:list_id])
    end

    def duplicate!(ctx, **)
      ctx['operation_status'] = :bad_request
      ctx['operation_message'] = I18n.t('graphql.errors.messages.movie.duplicate')
    end

    def list_not_found!(ctx, **)
      ctx['operation_status'] = :bad_request
      ctx['operation_message'] = I18n.t('graphql.errors.messages.list.not_found')
    end

    def movie_not_found!(ctx, **)
      ctx['operation_status'] = :bad_request
      ctx['operation_message'] = I18n.t('graphql.errors.messages.movie.not_found')
    end

    def set_result(ctx, model:, **)
      ctx['result'] = model
    end

    private

    def error_handler(exception, ctx)
      ctx['operation_status'] = :execution_error

      raise ActiveRecord::Rollback, exception.message
    end
  end
end
