class AddUsernameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string, limit: 50, null: false, default: "ๅ็กใ"
  end
end
