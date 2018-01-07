class CoupeCar < Car
  validates :down_places, :up_places, presence: true

  def name
    'Купе'
  end
end
