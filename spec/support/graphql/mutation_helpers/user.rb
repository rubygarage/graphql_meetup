# frozen_string_literal: true

module GraphQL
  module MutationHelpers
    def user_signup_mutation
      %(
        mutation userSignUp($input: UserSignUpInput!) {
          userSignUp(input: $input) {
            access
            csrf
            refresh
          }
        }
      )
    end

    def user_signin_mutation
      %(
        mutation userSignIn($input: UserSignInInput!) {
          userSignIn(input: $input) {
            access
            csrf
            refresh
          }
        }
      )
    end

    def signout_mutation
      %(
        mutation userSignOut {
          userSignOut {
            completed
          }
        }
      )
    end

    def refresh_token_mutation
      %(
        mutation {
          refreshToken {
            csrf
            access
            accessExpiresAt
          }
        }
      )
    end

    def user_add_favorite_movie_mutation
      %(
        mutation userAddFavoriteMovie($input: UserAddFavoriteMovieInput!) {
          userAddFavoriteMovie(input: $input) {
            id
            title
            isFavorite
          }
        }
      )
    end

    def user_remove_favorite_movie_mutation
      %(
        mutation userRemoveFavoriteMovie($input: UserRemoveFavoriteMovieInput!) {
          userRemoveFavoriteMovie(input: $input) {
            removedMovieId
          }
        }
      )
    end

    def user_add_watchlist_movie_mutation
      %(
        mutation userAddWatchlistMovie($input: UserAddWatchlistMovieInput!) {
          userAddWatchlistMovie(input: $input) {
            id
            title
            isWatchlist
          }
        }
      )
    end

    def user_remove_watchlist_movie_mutation
      %(
        mutation userRemoveWatchlistMovie($input: UserRemoveWatchlistMovieInput!) {
          userRemoveWatchlistMovie(input: $input) {
            removedMovieId
          }
        }
      )
    end

    def user_list_add_item_mutation
      %(
        mutation userAddListItem($input: UserAddListItemInput!) {
          userAddListItem(input: $input) {
            id
            items {
              id
              title
            }
          }
        }
      )
    end

    def user_list_remove_item_mutation
      %(
        mutation userRemoveListItem($input: UserRemoveListItemInput!) {
          userRemoveListItem(input: $input) {
            removedMovieId
          }
        }
      )
    end

    def user_create_list_mutation
      %(
        mutation userCreateList($input: UserCreateListInput!) {
          userCreateList(input: $input) {
            id
            lists {
              nodes {
                id
                name
                items {
                  id
                }
              }
            }
          }
        }
      )
    end

    def user_delete_list_mutation
      %(
        mutation userDeleteList($input: DeleteInput!) {
          userDeleteList(input: $input) {
            deletedListId
          }
        }
      )
    end
  end
end
