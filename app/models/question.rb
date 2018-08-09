class Question < ApplicationRecord
  has_many :replies
  belongs_to :user

  validates :content, presence: true
  validates :title, presence: true
end
