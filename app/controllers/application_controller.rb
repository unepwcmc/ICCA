# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  layout 'client'
    
  helper_method :current_user

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access Denied"
    redirect_to root_url
  end

  before_filter :set_user_language
  before_filter :default_url_options

  private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

  def set_user_language
    I18n.locale =  (params[:locale].present? ? params[:locale] : 'en')
  end

  # add the local to URLs
  def default_url_options(options={})
    { :locale => I18n.locale.to_s }
  end
end
