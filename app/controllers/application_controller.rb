class ApplicationController < ActionController::Base
  protect_from_forgery

  # Pundit Gem
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # set layout
  layout :layout_by_resource

  private

  # Pundit Gem
  def user_not_authorized
    flash[:alert] = t("messages.not_authorized")
    redirect_to(request.referrer || root_path)
  end

  # set layout
  def layout_by_resource
    if devise_controller? && resource_name == :admin
      "backoffice_devise"
    elsif devise_controller? && resource_name == :member
      "site_devise"
    else
      "application"
    end
  end
end
