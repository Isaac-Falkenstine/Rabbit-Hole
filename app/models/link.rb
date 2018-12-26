class Link < ApplicationRecord
  attr_reader  :name,
               :url

  belongs_to :question, dependent: :destroy

  validates_presence_of :name, :url

end
