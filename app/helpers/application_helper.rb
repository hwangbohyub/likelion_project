module ApplicationHelper
  def icon name
    content_tag(:span, '', class: ['glyphicon', "glyphicon-#{name}"])
  end

  def flash_msg msg_type
    result = ""
    if msg_type == 'notice'
      result = 'success'
    elsif msg_type == 'alert'
      result = 'warning'
    elsif msg_type == 'danger'
      result = 'danger'
    else
      result = 'info'
    end
    return result
  end
  
end
