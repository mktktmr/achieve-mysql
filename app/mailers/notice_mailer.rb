class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_blog.subject
  #
  def sendmail_blog(blog)
    @blog = blog

    mail to: "自分のメールアドレス",
         subject: '【Achieve】ブログが投稿されました'

    mail to: "to@example.org"
  end

  def sendmail_contact(contact)
    @contact = contact

    mail to: contact.email,
         subject: 'お問い合わせいただきありがとうございます'

    mail to: contact.email
  end
end