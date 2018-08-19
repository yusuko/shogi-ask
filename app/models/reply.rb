class Reply < ApplicationRecord
  belongs_to :question
  belongs_to :user

  has_many :comments

  validates :content, presence: true
end
