module SetSource
  extend ActiveSupport::Concern

  included do
    before_action :set_source
  end

  def set_source
    session[:source] = params[:q] if params[:q]
    session.delete(:source) unless current_user.is_a?(GuestUser)
  end
end