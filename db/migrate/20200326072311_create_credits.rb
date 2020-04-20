class CreateCredits < ActiveRecord::Migration[6.0]
  def change
    create_table :credits do |t|
      t.belongs_to :movie, foreign_key: true, index: true, null: false

      t.timestamps
    end

    create_table :casts do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :character, null: false

      t.belongs_to :credit, foreign_key: true, index: true, null: false

      t.timestamps
    end

    create_table :crews do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :department, null: false

      t.belongs_to :credit, foreign_key: true, index: true, null: false

      t.timestamps
    end
  end
end
