module ApplicationHelper
  def login_helper
    if current_user.is_a?(User)
      link_to "Logout", destroy_user_session_path, data: {turbo_method: :delete}
    else
      [
        link_to("Register", new_user_registration_path),
        link_to("Login", new_user_session_path)
      ].join(content_tag(:br)).html_safe
    end
  end

  def source_helper
    if session[:source]
      greeting = "Thank you for visiting me from #{session[:source]}"
      content_tag(:p, greeting, class: "source-greeting")
    end
  end
end
