class FixColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :cars, :counter, :number
  end
end
