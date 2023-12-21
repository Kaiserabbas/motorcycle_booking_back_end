class RemoveRoleFromMotorcycle < ActiveRecord::Migration[7.1]
  def change
    remove_column :motorcycles, :role, :string
  end
end
