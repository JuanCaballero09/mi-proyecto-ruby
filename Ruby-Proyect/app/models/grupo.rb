class Grupo < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :nombre, presence: true
end
