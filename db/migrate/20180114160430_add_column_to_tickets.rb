class AddColumnToTickets < ActiveRecord::Migration[5.1]
  def change
    change_table :tickets do |t|
      t.string :passenger_name
      t.string :passenger_lastname
      t.string :passenger_patronymic
      t.string :passport_number
      t.string :passport_series
    end
  end
end
