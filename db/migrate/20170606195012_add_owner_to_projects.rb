class AddOwnerToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :owner_id, :integer, null: false
  end
end
