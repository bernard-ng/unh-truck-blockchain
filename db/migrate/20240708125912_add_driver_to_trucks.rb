class AddDriverToTrucks < ActiveRecord::Migration[7.1]
  def change
    add_reference :trucks, :driver, null: true, foreign_key: true
  end
end
