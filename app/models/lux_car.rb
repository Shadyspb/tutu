class LuxCar < Car
  validates :down_places, presence: true

  def name
    'СВ'
  end
end
