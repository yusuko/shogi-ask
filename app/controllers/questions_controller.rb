# = QuestionsController

class QuestionsController < ApplicationController
  def index
    @questions = Question.paginate(page: params[:page], per_page: 20)
  end

  def new
    @question = Question.new
  end

  def create
    question = Question.new(question_params)
    redirect_after_question_create(question)
  end

  def show
    @question = Question.find(params[:id])
    @replies = @question.replies
    @reply = Reply.new
  end

  private

  def question_params
    params.require(:question).permit(:title, :content)
  end

  def redirect_after_question_create(question)
    if question.save
      flash[:success] = '質問が投稿されました!'
      redirect_to(root_url)
    else
      flash[:danger] = question.errors.full_messages
      @question = Question.new
      render 'new'
    end
  end
end
