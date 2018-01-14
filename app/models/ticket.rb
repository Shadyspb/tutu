class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :train
  belongs_to :start_station, class_name: 'RailwayStation'
  belongs_to :finish_station, class_name: 'RailwayStation'

  validates :passenger_name, :passenger_lastname, :passenger_patronymic, :passport_number, :passport_series, presence: true
end
