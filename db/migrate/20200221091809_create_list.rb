class CreateList < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.string :description, null: false
      t.string :name, null: false
      t.belongs_to :user_account, foreign_key: true, index: true
      t.timestamps
    end
  end
end
