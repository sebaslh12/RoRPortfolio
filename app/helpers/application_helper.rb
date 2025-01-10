module ApplicationHelper
  def login_helper class_name
    if current_user.is_a?(GuestUser)
      [
        link_to("Register", new_user_registration_path, class: class_name),        link_to("Login", new_user_session_path, class: class_name),
      ].join(" ").html_safe
    else
      link_to "Logout", destroy_user_session_path, data: {turbo_method: :delete}, class: class_name
    end
  end

  def source_helper
    if session[:source]
      greeting = "Thank you for visiting me from #{session[:source]}"
      content_tag(:p, greeting, class: "source-greeting")
    end
  end
end
