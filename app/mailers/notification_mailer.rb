class NotificationMailer < ActionMailer::Base
  default from: 'shogi.ask@challenge.com'

  def reply_notification
    @user = params[:question].user
    @url  = question_url(params[:question])
    mail(to: @user.email, subject: 'あなたの質問に回答が来ました！')
  end
end
