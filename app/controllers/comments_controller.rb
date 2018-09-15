class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    comment = Comment.create(comment_params)
    if comment
      question = Reply.find(params[:id]).question
      flash[:success] = 'コメントが正しく投稿されました。'
      redirect_to question
    else
      flash.now[:danger] = 'コメントが正しく投稿されませんした。'
      render 'root'
    end
  end

  private

  def comment_params
    params.require(:comment)
          .permit(:content)
          .merge(reply_id: params[:id], user_id: current_user.id)
  end
end
