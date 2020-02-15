class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.string :original_title
      t.string :overview
      t.integer :revenue
      t.integer :budget
      t.integer :runtime
      t.string :original_language
      t.timestamps
    end
  end
end
