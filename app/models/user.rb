class User < ApplicationRecord
  has_many :tokens
  has_many :topics

  validates_presence_of :first_name,
                        :last_name,
                        :email,
                        :password

  validates :email, uniqueness: true

  has_secure_password
end
