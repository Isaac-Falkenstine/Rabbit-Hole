class GoogleOauthToken < ApplicationRecord
  belongs_to :user

<<<<<<< HEAD
  validates_presence_of :tokenx
=======
  validates_presence_of :token
>>>>>>> master
                        :refresh_token

  validates :user_id, uniqueness: true
end
