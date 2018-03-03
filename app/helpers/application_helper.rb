module ApplicationHelper

  def login_helper
    if current_user.is_a?(User)
      link_to 'Logout', destroy_user_session_path, method: :delete,
                    data: {confirm: 'Are you sure you want to logout?'},
                    class: 'btn btn-danger'
    else
      (link_to 'Register',
               new_user_registration_path, class: 'btn btn-warning') +
        '<br/>'.html_safe +
        (link_to 'Login',
               new_user_session_path, class: 'btn btn-success')
    end
  end

end
