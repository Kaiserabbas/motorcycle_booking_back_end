class AddColumnsToReservation < ActiveRecord::Migration[7.1]
  def change
    add_column :reservations, :date, :date
    add_column :reservations, :city, :string
  end
end
