class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable, :confirmable

  # ==========================================================
  # Callbacks
  # ==========================================================
  after_initialize :assign_api_token

  def refresh_api_token
    self.update(api_token: SecureRandom.uuid)
  end

  private

  def assign_api_token
    self.api_token ||= SecureRandom.uuid
  end
end
