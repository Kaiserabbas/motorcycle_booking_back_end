class AddVisibleToMotorcycles < ActiveRecord::Migration[7.1]
  def change
    add_column :motorcycles, :visible, :boolean
  end
end
