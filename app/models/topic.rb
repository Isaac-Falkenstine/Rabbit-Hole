class Topic < ApplicationRecord
  belongs_to :user
  has_many :questions

  validates_presence_of :title

end
