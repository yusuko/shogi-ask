class QuestionCategory < ApplicationRecord
  belongs_to :category
  belongs_to :question
end
