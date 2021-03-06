class Question < ApplicationRecord
  mount_uploader :image, QuestionImageUploader
  has_many :replies
  belongs_to :user
  has_many :question_categories
  has_many :categories, through: :question_categories

  validates :content, presence: true
  validates :title, presence: true

  def self.list_with_paginate(params)
    Question.includes(:user, :categories, :replies)
            .paginate(page: params[:page], per_page: 20)
            .order(id: :desc)
  end

  def create_categories(category_params)
    return unless category_params[:category_ids]
    category_params[:category_ids].each do |category_id|
      QuestionCategory.create(category_id: category_id, question_id: id)
    end
  end

  def solved?
    return true if best_reply_id
  end

  def best_reply
    id = self.best_reply_id
    Reply.find_by(id: id)
  end
end
