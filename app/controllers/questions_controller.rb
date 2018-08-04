# = QuestionsController

class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    question = Question.new(questions_params)
    redirect_to(root_url) && return if question.save
    render 'questions#new'
  end

  private

  def questions_params
    params.require(:question).permit(:title, :content)
  end
end
