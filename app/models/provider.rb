class Provider < ApplicationRecord
  # ==========================================================
  # Validations
  # ==========================================================
  validates :name, presence: true
end
