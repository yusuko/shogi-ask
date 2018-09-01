class DeviseMailer < Devise::Mailer
  def confirmation_instructions(record, token, opts={})
    mail = super
    mail.subject = "【Asuki】新規登録の確認用URLのお知らせ"
    mail
  end
end
