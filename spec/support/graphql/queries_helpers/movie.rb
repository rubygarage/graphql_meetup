# frozen_string_literal: true

module GraphQL
  module MutationsHelper
    def movies_query
      %(
        query movies(
          $after: String
          $before: String
          $first: Int
          $last: Int
        ) {
          movies(
            after: $after
            before: $before
            first: $first
            last: $last
          ) {
            totalCount
            pageInfo {
              endCursor
              hasNextPage
              hasPreviousPage
              startCursor
            }
            edges {
              cursor
              node {
                id
                title
                originalTitle
                overview
                revenue
                budget
                runtime
                originalLanguage
                poster {
                  id
                  filePath
                }
                images {
                  id
                  filePath
                }
              }
            }
          }
        }
      )
    end
  end
end
