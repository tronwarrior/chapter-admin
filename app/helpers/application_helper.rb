module ApplicationHelper
    def toggle_element_class(id, class_name)
    logger.info("---->>>> Setting " + id.to_s + " to class " + class_name.to_s)
    javascript_tag("$('#{id}').toggleClassName('#{class_name}')");
  end

  def set_focus_to(id)
    javascript_tag("$('#{id}').focus()");
  end
end
