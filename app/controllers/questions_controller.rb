# = QuestionsController

class QuestionsController < ApplicationController
  def index
    @questions = Question.paginate(page: params[:page], per_page: 20)
  end

  def new
    @question = Question.new
  end

  def create
    question = Question.new(questions_params)
    redirect_after_question_create(question)
  end

  private

  def questions_params
    params.require(:question).permit(:title, :content)
  end

  def redirect_after_question_create(question)
    if question.save
      flash[:success] = '質問が投稿されました!'
      redirect_to(root_url) && return
    else
      flash[:danger] = question.errors.full_messages
      @question = Question.new
      render 'new'
    end
  end
end
