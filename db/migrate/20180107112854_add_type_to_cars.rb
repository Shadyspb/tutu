class AddTypeToCars < ActiveRecord::Migration[5.1]
  def change
    change_table :cars do |t|
      t.string :type
      t.integer :side_down_places
      t.integer :side_up_places
      t.integer :seat_places
    end
  end
end
