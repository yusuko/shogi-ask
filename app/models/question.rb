class Question < ApplicationRecord
  has_many :replies
  has_one :best_reply, class_name: "Reply"
  belongs_to :user
  has_many :question_categories
  has_many :categories, through: :question_categories

  validates :content, presence: true
  validates :title, presence: true

  def create_category(category_id)
    QuestionCategory.create(category_id: category_id, question_id: id)
  end

  def solved?
    return true if best_reply_id
  end
end
