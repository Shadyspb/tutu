class Car < ApplicationRecord
  belongs_to :train
  KINDS = %w[Купе Плацкартный].freeze

  scope :coupe, -> { where(kind: 'Купе') }
  scope :regular, -> { where(kind: 'Плацкартный') }
end
