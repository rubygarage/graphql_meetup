class RemoveDescriptionNotNullConstraintFromLists < ActiveRecord::Migration[6.0]
  List = Class.new(ApplicationRecord)

  def up
    change_column :lists, :description, :string, null: true
  end

  def down
    List.where(description: nil).update_all(description: SecureRandom.alphanumeric)

    change_column :lists, :description, :string, null: false
  end
end
