class GoogleOauthToken < ApplicationRecord
  belongs_to :user

  validates_presence_of :tokenx
                        :refresh_token

  validates :user_id, uniqueness: true
end
