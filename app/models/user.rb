class User < ApplicationRecord

  has_many :topics
  has_many :questions, through: :topics
  has_one :google_oauth_token

  validates_presence_of :first_name,
                        :last_name,
                        :email

  validates :email, uniqueness: true

  has_secure_password validations: false

  def self.from_omniauth(data)
    where(email: data["info"]["email"]).first_or_initialize do |user|
      user.first_name = data["info"]["first_name"]
      user.last_name = data["info"]["last_name"]
      user.email = data["info"]["email"]
    end
  end
end
