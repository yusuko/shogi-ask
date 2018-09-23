class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    comment, redirected_question = Comment.creates(comment_params)
    if comment
      flash[:success] = 'コメントが正しく投稿されました。'
      redirect_to redirected_question
    else
      flash.now[:danger] = 'コメントが正しく投稿されませんした。'
      render redirected_question
    end
  end

  private

  def comment_params
    params.require(:comment)
          .permit(:content)
          .merge(reply_id: params[:id], user_id: current_user.id)
  end
end
