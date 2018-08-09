class RepliesController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def create
    reply = Reply.new(reply_params.merge(user_id: current_user.id))
    redirect_after_reply_create(reply)
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
end
