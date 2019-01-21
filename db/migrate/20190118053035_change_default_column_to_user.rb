class ChangeDefaultColumnToUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :nickname, :string, null: true
  end
end
