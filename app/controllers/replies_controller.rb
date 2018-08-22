class RepliesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_question_user, only: [:select_best_answer, :delete_best_answer]
  def create
    reply = Reply.new(reply_params.merge(user_id: current_user.id))
    redirect_after_reply_create(reply)
  end

  def select_best_answer
    @question.update_attributes(best_reply_id: params[:id])
    redirect_to @question
  end

  def delete_best_answer
    @question.update_attributes(best_reply_id: nil)
    redirect_to @question
  end

  private

  def reply_params
    params.require(:reply).permit(:content, :question_id)
  end

  def redirect_after_reply_create(reply)
    if reply.save
      flash[:success] = '回答が投稿されました!'
      question = reply.question
      redirect_to(question)
    else
      flash[:danger] = reply.errors.full_messages
      question = Question.find(params[:reply][:question_id])
      redirect_to(question)
    end
  end

  def authenticate_question_user
    reply = Reply.find(params[:id])
    @question = reply.question
    redirect_to root_url unless current_user == @question.user
  end
end
