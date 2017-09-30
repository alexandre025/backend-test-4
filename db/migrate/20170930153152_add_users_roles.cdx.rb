# This migration comes from cdx (originally 20170926091237)
class AddUsersRoles < ActiveRecord::Migration[5.1]
  def change
    add_column :cdx_users, :roles, :string, array: true, default: []
  end
end
