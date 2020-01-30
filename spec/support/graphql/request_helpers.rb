# frozen_string_literal: true

module GraphQL
  module RequestHelpers
    include ActionDispatch::Integration::RequestHelpers

    def graphql_post(query:, variables: {}, headers: nil, **kwargs)
      post(
        '/graphql',
        params: {
          query: query,
          variables: normalize_hash(variables).to_json
        },
        headers: headers,
        **kwargs
      )
    end

    private

    def normalize_hash(hash)
      raise unless hash.is_a?(Hash)

      hash = convert_decimal_values(hash)

      camelize_hash_keys(hash)
    end

    def convert_decimal_values(hash)
      # decimals are converted to string after converting to json
      # need to convert decimals to floats
      hash.transform_values do |value|
        next convert_decimal_values(value) if value.is_a?(::Hash)

        value.is_a?(::BigDecimal) ? value.to_f : value
      end
    end

    def camelize_hash_keys(hash)
      hash.deep_transform_keys { |key| key.to_s.camelize(:lower) }
    end
  end
end
