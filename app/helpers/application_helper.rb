module ApplicationHelper

  def error_messages(model)
    return if model.errors.empty?

    content_tag(:div, class: 'alert alert-danger') do
      content_tag(:ul) do
        model.errors.full_messages.map { |m| content_tag(:li, m) }.join.html_safe
      end
    end
  end

end
