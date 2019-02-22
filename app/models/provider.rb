class Provider < ApplicationRecord
  # ==========================================================
  # Validations
  # ==========================================================
  validates :name, presence: true

  # ==========================================================
  # Relations
  # ==========================================================
  has_many :trackings, dependent: :destroy
end
