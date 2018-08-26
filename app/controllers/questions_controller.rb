# = QuestionsController

class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @questions = Question.list_with_paginate(params)
  end

  def new
    @question = Question.new
    @category = Category.new
  end

  def create
    question = Question.new(question_params.merge(user_id: current_user.id))
    redirect_after_question_create(question, category_params.to_i)
  end

  def show
    @question = Question.includes(:user).find(params[:id])
    @replies = @question.replies.includes(:user, :comments)
    @reply = Reply.new
    @comment = Comment.new
  end

  private

  def category_params
    params.require(:category)
  end

  def question_params
    params.require(:question).permit(:title, :content)
  end

  def redirect_after_question_create(question, category_id)
    if question.save
      question.create_category(category_id)
      flash[:success] = '質問が投稿されました!'
      redirect_to(root_url)
    else
      flash[:danger] = question.errors.full_messages
      @question = Question.new
      render 'new'
    end
  end
end
