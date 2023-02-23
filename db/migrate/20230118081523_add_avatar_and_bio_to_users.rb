class AddAvatarAndBioToUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :users, bulk: true do |t|
      t.string :avatar
    end
  end
end
