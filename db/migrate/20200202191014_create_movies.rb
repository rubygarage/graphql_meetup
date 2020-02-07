class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.string :original_title
      t.string :overview
      t.integer :revenue
      t.integer :budget
      t.string :runtime
      t.string :original_language
    end
  end
end
