class RemoveVisibleFromMotorcycle < ActiveRecord::Migration[7.1]
  def change
    remove_column :motorcycles, :visible, :boolean
  end
end
