class UpdateUsersNameToNullFalse < ActiveRecord::Migration[5.2]
  def change
    change_column_null :authors, :name, false
  end
end
