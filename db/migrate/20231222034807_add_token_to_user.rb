class AddTokenToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :token, :text
  end
end
