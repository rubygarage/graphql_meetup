class CreateMovieImages < ActiveRecord::Migration[6.0]
  def change
    create_table :movie_images do |t|
      t.timestamps
    end

    add_reference :movie_images, :movie, foreign_key: true, null: false
  end
end
