class Reply < ApplicationRecord
  belongs_to :question

  validates :content, presence: true
end
