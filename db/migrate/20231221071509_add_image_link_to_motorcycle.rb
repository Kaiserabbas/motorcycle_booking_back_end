class AddImageLinkToMotorcycle < ActiveRecord::Migration[7.1]
  def change
    add_column :motorcycles, :imageLink, :text
  end
end
