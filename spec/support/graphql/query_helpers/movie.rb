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
          $filter: String
        ) {
          moviesSearch(
            after: $after
            before: $before
            first: $first
            last: $last
            filter: $filter
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

    def movie_query
      %(
        query movie($id: ID!) {
          movie(id: $id) {
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
      )
    end

    def trending_movies_query
      %(
        query trendingMovies {
          trendingMovies {
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
      )
    end
  end
end
