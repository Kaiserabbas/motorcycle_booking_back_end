class User < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :motorcycles, through: :reservations

  validates_presence_of :name, :email
  validates :email, uniqueness:true
  validates :password, presence: true, length: { minimum: 6, maximum: 12 }


  has_secure_password

  def generate_jwt
    JWT.encode({ id:, exp: 31.days.from_now.to_i }, Rails.application.secrets.secret_key_base)
  end

  def self.form_jwt(token)
    JWT.decode(token, Rails.application.secrets.secret_key_base)[0]['id']
  end

  def admin?
    admin
  end
end
