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
end
