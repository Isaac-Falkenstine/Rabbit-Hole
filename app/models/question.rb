class Question < ApplicationRecord
  belongs_to :topic, dependent: :destroy
  has_many :links

  validates_presence_of :title
end
