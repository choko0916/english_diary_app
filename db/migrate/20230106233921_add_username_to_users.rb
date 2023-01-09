class AddUsernameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string, limit: 50, null: false, default: "名無し"
  end
end
