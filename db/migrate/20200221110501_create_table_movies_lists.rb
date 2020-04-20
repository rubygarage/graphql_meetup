class CreateTableMoviesLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists_movies do |t|
      t.belongs_to :list, foreign_key: true, index: true
      t.belongs_to :movie, foreign_key: true, index: true

      t.timestamps
    end

    add_index :lists_movies, %i[list_id movie_id], unique: true
  end
end
