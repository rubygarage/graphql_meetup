# frozen_string_literal: true

OperationMatcher = Dry::Matcher.new(
  file_success: Dry::Matcher::Case.new(
    match: ->(result) { result.success? && result[:filename] },
    resolve: ->(result) { result }
  ),
  success: Dry::Matcher::Case.new(
    match: ->(result) { result.success? },
    resolve: ->(result) { result['result'] }
  ),
  validation_error: Dry::Matcher::Case.new(
    match: lambda do |result|
      result.failure? &&
        !result['operation_status'] &&
        result['result.contract.default'] &&
        result['result.contract.default'].errors.messages.any?
    end,
    resolve: ->(result) { result['result.contract.default'] }
  ),
  not_found: Dry::Matcher::Case.new(
    match: lambda do |result|
      result.failure? && (
        (result['result.model'] && result['result.model'].failure?) ||
          result['operation_status'] == :not_found
      )
    end,
    resolve: ->(result) { result }
  ),
  credentials_error: Dry::Matcher::Case.new(
    match: ->(result) { result.failure? && result['operation_status'] == :credentials_error },
    resolve: ->(result) { result }
  ),
  not_authorized: Dry::Matcher::Case.new(
    match: ->(result) { result['result.policy.default'] && result['result.policy.default'].failure? },
    resolve: ->(result) { result }
  ),
  execution_error: Dry::Matcher::Case.new(
    match: ->(result) { result.failure? && result['operation_status'] == :execution_error },
    resolve: ->(result) { result }
  ),
  bad_request: Dry::Matcher::Case.new(
    match: ->(result) { result.failure? && result['operation_status'] == :bad_request },
    resolve: ->(result) { result }
  )
)
