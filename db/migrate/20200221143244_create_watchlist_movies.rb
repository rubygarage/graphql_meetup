class CreateWatchlistMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :watchlist_movies do |t|
      t.timestamps
    end

    add_reference :watchlist_movies, :user_account, foreign_key: true, null: false
    add_reference :watchlist_movies, :movie, foreign_key: true, null: false

    add_index :watchlist_movies, %i[user_account_id movie_id], unique: true
  end
end
