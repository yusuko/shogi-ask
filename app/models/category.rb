class Category < ApplicationRecord
  has_many :question_categories
  has_many :categories, through: :question_categories
end
