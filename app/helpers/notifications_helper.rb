module NotificationsHelper
  def sender_user(notification)
    sender_user_name = User.find(notification.recipient_id).name
  end

  def receive_user(notification)
    receive_user_name = User.find(notification.sender_id).name
  end

  def posted_time(time)
    time > Date.today ? "#{time_ago_in_words(time)}" : time.strftime('%m月%d日')
  end

  def display_read_status(read)
    read ? "既読" : "未読"
  end
end
