class AddCounterToCars < ActiveRecord::Migration[5.1]
  def change
    add_column :cars, :counter, :integer
  end
end
