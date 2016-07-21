module SubmitRequestsHelper
  def status_display_name(status)
    case status
      when 1
        '未承認'
      when 2
        '承認済'
      when 8
        '取消済'
      when 9
        '却下'
    end
  end

  def done_display_name(done)
    done ? '完了' : '未完了'
  end
end

