class Topic < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :questions

  validates_presence_of :title

  def last_created_question
    questions.order(:created_at).first
  end

end
