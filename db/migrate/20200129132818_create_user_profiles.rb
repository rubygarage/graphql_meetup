class CreateUserProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :user_profiles do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.timestamps
    end

    add_reference :user_profiles, :user_account, foreign_key: true, null: false
  end
end
