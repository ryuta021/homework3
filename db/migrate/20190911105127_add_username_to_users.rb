class AddUsernameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_index :users, :username, unique: true

    #config.authentication_keys = [:username]
  end
end
