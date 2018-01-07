class RegularCar < Car
  validates :down_places, :up_places, :side_down_places, :side_up_places, presence: true

  def name
    'Плацкарт'
  end
end
