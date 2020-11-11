class RemoveRolesFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :superadmin_role, :boolean
    remove_column :users, :organisation_role, :boolean
    remove_column :users, :user_role, :boolean
  end
end
