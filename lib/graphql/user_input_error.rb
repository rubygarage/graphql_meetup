# frozen_string_literal: true

module GraphQL
  class UserInputError < ExecutionError
    def initialize(message, ast_node: nil, options: nil, extensions: nil, errors: Reform::Contract::Errors.new)
      @ast_node = ast_node
      @options = options
      @extensions = extensions
      @errors = errors

      super(message)
    end

    def to_h
      super.merge(
        'extensions' => {
          'code' => 'USER_INPUT_ERROR',
          'exception' => {
            'validationErrors' => validation_errors
          }
        }
      )
    end

    private

    def validation_errors
      @errors.messages.each_with_object({}, &add_error)
    end

    def add_error
      lambda do |(key, value), errors|
        error_message =
          if value[0].is_a?(Array)
            add_error.call([value[0][0], value[0][1]], {}).deep_transform_keys { |k| k.to_s.camelize(:lower) }
          else
            value
          end
        errors[key.to_s.camelize(:lower)] = error_message
        errors
      end
    end
  end
end
