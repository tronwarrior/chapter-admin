module ApplicationHelper
    def toggle_element_class(id, class_name)
    logger.info("---->>>> Setting " + id.to_s + " to class " + class_name.to_s)
    javascript_tag("$('#{id}').toggleClassName('#{class_name}')");
  end

  def set_focus_to(id)
    javascript_tag("$('#{id}').focus()");
  end

  def get_todays_month_name
    return Date::MONTHNAMES[Date.today.month]
  end

  def get_next_months_name
    return Date::MONTHNAMES[Date.today.next_month.month]
  end

  def get_prev_months_name
    return Date::MONTHNAMES[Date.today.prev_month.month]
  end

  def get_todays_month_name_and_year
    s = get_todays_month_name + " " + Date.today.year.to_s
    return s
  end

end
