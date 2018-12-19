class Question < ApplicationRecord
  belongs_to :topic
  has_many :links

  validates_presence_of :title
end
