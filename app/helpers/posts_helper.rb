module PostsHelper
  def icon name
    content_tag(:span, '', class: ['glyphicon', "glyphicon-#{name}"])
  end
end
