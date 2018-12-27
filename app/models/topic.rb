class Topic < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :questions

  validates_presence_of :title

  def last_created_question
    questions.order(:created_at).first
  end

  def has_questions
    true if questions.length > 0
  end

end
