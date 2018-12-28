class Topic < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :questions

  validates_presence_of :title

  def last_created_question
    questions.order(:created_at).last
  end

  def has_questions
    true if questions.length > 0
  end

  def created_at_format
    self.created_at.strftime("%a, %d %B of %Y")
  end

  def updated_at_format
    self.updated_at.strftime("%a, %d %B of %Y")
  end

end
