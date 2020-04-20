# frozen_string_literal: true

module GraphQL
  module QueryHelpers
    def list_query
      %(
        query list($id: ID!) {
          list(id: $id) {
            id
            name
            items {
              id
              title
              originalTitle
              overview
              revenue
              budget
              runtime
              originalLanguage
              poster {
                filePath
              }
              images {
                filePath
              }
            }
          }
        }
      )
    end
  end
end
