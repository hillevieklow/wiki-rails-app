module ApplicationHelper
  def home_path
    if logged_in?
      return user_path(session[:user_id])
    else
      return :welcome
    end
  end

  def sort_select_tag(sort_field)
    fields= [{value: '', display: 'Choose Sort Field'},
             {value: 'category', display: 'Category'},
             {value: 'title', display: 'Title'},
             {value: 'upvotes', display: 'Upvotes'},
             {value: 'updated_at', display: 'Latest Update'}]

    html = "<select name='sort' id='sort'>"
    fields.each do |field|
      html += "<option #{sort_selected_option(field[:value], sort_field)} "
      html += " value=#{field[:value]}>#{field[:display]}</option>"
    end
    html.html_safe
  end

  def sort_selected_option(field, sort_field)
      field == sort_field ? "selected='selected'" : ""
  end
end
