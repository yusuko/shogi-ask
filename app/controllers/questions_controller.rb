# = QuestionsController

class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @questions = Question.list_with_paginate(params)
    @categories = Category.all
  end

  def new
    @question = Question.new
  end

  def create
    question = Question.new(question_params.merge(user_id: current_user.id))
    redirect_after_question_create(question, category_params)
  end

  def show
    @question = Question.includes(:user).find(params[:id])
    @replies = @question.replies.includes(:user, :comments)
    @reply = Reply.new
    @comment = Comment.new
    @categories = @question.categories
  end

  private

  def category_params
    params.require(:question).permit(category_ids: [])
  end

  def question_params
    params.require(:question).permit(:title, :content, :image)
  end

  def redirect_after_question_create(question, category_params)
    if question.save
      question.create_categories(category_params)
      flash[:success] = '質問が投稿されました!'
      redirect_to(root_url)
    else
      flash[:danger] = question.errors.full_messages
      @question = Question.new
      render 'new'
    end
  end
end
