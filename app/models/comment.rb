class Comment < ApplicationRecord
  belongs_to :reply

  validates :content, presence: true
end
