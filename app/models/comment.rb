class Comment < ApplicationRecord
  belongs_to :reply
  belongs_to :user

  validates :content, presence: true

  def self.creates(params)
    comment = Comment.create(params)
    commented_reply = Reply.find(params[:reply_id])
    redirected_question = commented_reply.question
    send_user = User.find(params[:user_id])
    send_comment_notification_email(commented_reply, send_user) if comment
    [comment, redirected_question]
  end

  def self.send_comment_notification_email(reply, send_user)
    return unless thread_users(reply, send_user)
    thread_users(reply, send_user).each do |user|
      NotificationMailer.with(question: reply.question, user: user).comment_notification.deliver_later
    end
  end

  def self.thread_users(reply, send_user)
    thread_users = []
    thread_users << reply.user unless reply.user == send_user
    if reply.comments
      reply.comments.each do |comment|
        thread_users << comment.user unless comment.user == send_user
      end
    end
    thread_users.uniq!
  end
end
