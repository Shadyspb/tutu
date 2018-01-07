class AddSortFromHeadToTrains < ActiveRecord::Migration[5.1]
  def change
    add_column :trains, :sort_from_head, :boolean, default: true, null: false
  end
end
