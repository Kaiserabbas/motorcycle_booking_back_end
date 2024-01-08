class AddDescriptionToMotorcycle < ActiveRecord::Migration[7.1]
  def change
    add_column :motorcycles, :description, :text
  end
end
