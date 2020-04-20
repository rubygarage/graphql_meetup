class CreateFavoriteMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_movies do |t|
      t.timestamps
    end

    add_reference :favorite_movies, :user_account, foreign_key: true, null: false
    add_reference :favorite_movies, :movie, foreign_key: true, null: false

    add_index :favorite_movies, %i[user_account_id movie_id], unique: true
  end
end
