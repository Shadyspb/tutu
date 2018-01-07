class SeatCar < Car
  validates :seat_places, presence: true

  def name
    'Сидячий'
  end
end
