# frozen_string_literal: true

class MatchOperationResult
  #
  # arguments
  # - operation_result: trailblazer operation after call
  # - context: graphql mutation context
  #
  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
  def call(operation_result:, **)
    OperationMatcher.call(operation_result) do |m|
      m.success { |result| result }

      m.validation_error do |result|
        raise GraphQL::UserInputError.new(
          I18n.t('graphql.errors.messages.user_input'),
          errors: result.errors
        )
      end

      m.not_found do |result|
        raise GraphQL::RuntimeError, result['operation_message'] || I18n.t('graphql.errors.messages.not_found')
      end

      m.not_authorized do
        raise GraphQL::ForbiddenError, I18n.t('graphql.errors.messages.not_authorized')
      end

      m.credentials_error do |result|
        raise GraphQL::AuthenticationError, contract_base_error(result)
      end

      m.execution_error do |result|
        raise GraphQL::RuntimeError, result['operation_message'] || contract_base_error(result)
      end

      m.bad_request do |result|
        raise GraphQL::RuntimeError, result['operation_message'] || contract_base_error(result)
      end
    end
  end

  private

  def contract_base_error(result)
    result['contract.default'].errors[:base].join(' ')
  end
  # rubocop:enable Metrics/MethodLength, Metrics/AbcSize
end
