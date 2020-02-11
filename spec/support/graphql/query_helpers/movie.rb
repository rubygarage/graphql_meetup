# frozen_string_literal: true

module GraphQL
  module QueryHelpers
    def movies_search_query
      %(
        query moviesSearch(
          $after: String
          $before: String
          $first: Int
          $last: Int
        ) {
          moviesSearch(
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
                  filePath
                }
                images {
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
