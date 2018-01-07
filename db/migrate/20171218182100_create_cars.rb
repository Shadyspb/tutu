class CreateCars < ActiveRecord::Migration[5.1]
  def change
    create_table :cars do |t|
      t.string :kind
      t.string :lol
      t.integer :up_places
      t.integer :down_places
      t.timestamps
    end
  end
end
