class Reply < ApplicationRecord
  belongs_to :question
  belongs_to :user

  has_many :comments

  validates :content, presence: true

  def self.creates(params)
    reply = Reply.create(params)
    replied_question = Question.find(params[:question_id])
    send_notification_email(replied_question) if reply
    [reply, replied_question]
  end

  private

  def self.send_notification_email(question)
    NotificationMailer.with(question: question).reply_notification.deliver_later
  end
end
