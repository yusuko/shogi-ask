class RepliesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_question_user, only: [:select_best_answer, :delete_best_answer]
  def create
    reply, replied_question = Reply.creates(reply_params.merge(user_id: current_user.id))
    create_flash_message(reply)
    redirect_to replied_question
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

  def create_flash_message(reply)
    if reply
      flash[:success] = '回答が投稿されました!'
    else
      flash[:danger] = '回答の投稿に失敗しました'
    end
  end
      # It may be better to return reply.errors(when using Reply.new)

  def authenticate_question_user
    reply = Reply.find(params[:id])
    @question = reply.question
    redirect_to root_url unless current_user == @question.user
  end
end
