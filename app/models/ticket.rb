class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :train
  belongs_to :start_station, class_name: 'RailwayStation'
  belongs_to :finish_station, class_name: 'RailwayStation'

  after_create :send_notification
  after_destroy :return_notification

  validates :passenger_name, :passenger_lastname, :passenger_patronymic, :passport_number, :passport_series, presence: true

  def route_name
    "#{start_station.title} - #{finish_station.title}"
  end

  private

  def send_notification
    TicketsMailer.buy_ticket(self.user, self).deliver_now
  end

  def return_notification
    TicketsMailer.return_ticket(self.user, self).deliver_now
  end
end
