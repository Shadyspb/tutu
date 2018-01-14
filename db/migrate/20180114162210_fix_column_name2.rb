class FixColumnName2 < ActiveRecord::Migration[5.1]
  def change
      rename_column :tickets, :from_station_id, :start_station_id
      rename_column :tickets, :to_station_id, :finish_station_id
  end
end
