module ApplicationHelper

  def login_helper(style = '')
    if current_user.is_a?(GuestUser)
      (link_to 'Register', new_user_registration_path, class: style) +
        ' '.html_safe +
        (link_to 'Login', new_user_session_path, class: style)
    else
      link_to 'Logout', destroy_user_session_path, method: :delete,
                                                   data: { confirm: 'Are you sure you want to logout?' },
                                                   class: style
    end
  end

  def source_helper(style)
    if session[:source]
      greeting =
        "Thanks for visiting me from #{session[:source]}!
        Feel free to #{link_to 'contact me', contact_path} if you
        would like to work together."
      content_tag(:div, greeting.html_safe, class: style, id: 'greeting-block')
    end
  end

  def copyright_generator
    TrabueViewTool::Renderer.copyright 'Nikolas Trabue', 'All rights reserved'
  end

  def alerts
    alert = (flash[:alert] || flash[:error] || flash[:notice])
    alert_generator(alert) if alert
  end

  def alert_generator(msg)
    js add_gritter(msg, title: "Nikolas Trabue Portfolio", sticky: false)
  end
end
