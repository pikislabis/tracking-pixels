class Tracking < ApplicationRecord
  # ==========================================================
  # Validations
  # ==========================================================
  validates :name, presence: true

  # ==========================================================
  # Relations
  # ==========================================================
  belongs_to :provider

  # ==========================================================
  # Callbacks
  # ==========================================================
  after_initialize :assign_code

  private

  def assign_code
    self.code ||= SecureRandom.uuid
  end
end
