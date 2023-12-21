class User < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :motorcycles, through: :reservations

  validates_presence_of :name, :email
  validates_presence_of :password, length: { minimum: 6, maximum: 12 }, allow_nil: true

  has_secure_password

  def generate_jwt
    JWT.encode({ id:, exp: 2.days.from_now.to_i }, Rails.application.secrets.secret_key_base)
  end

  def self.form_jwt(token)
    JWT.decode(token, Rails.application.secrets.secret_key_base)[0]['id']
  end

  def admin?
    admin=self.admin
  end
end
