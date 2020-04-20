class AddUniqIndexToLists < ActiveRecord::Migration[6.0]
  def change
    add_index :lists, [:name, :user_account_id], unique: true
  end
end
