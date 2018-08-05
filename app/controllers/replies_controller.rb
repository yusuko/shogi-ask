class RepliesController < ApplicationController
  def create
    reply = Reply.new(reply_params)
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
