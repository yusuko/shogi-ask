class Question < ApplicationRecord
  has_many :replies

  validates :content, presence: true
  validates :title, presence: true
end
