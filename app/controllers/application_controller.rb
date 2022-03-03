# frozen_string_literal: true

# NOTE: this ensures that all controllers are auth'ed by default
# the authenticate_user is generated by devise and redirects unauth'ed
# users to the login page

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :print_session

  def print_session
    # puts 'UID'
    # puts session[:uid]
    Rails.logger.debug(session[:profile_pic])
    Rails.logger.debug('ID:')
    Rails.logger.debug(session[:memberID])
  end

  def admin?
    unless session[:isAdmin]
      Rails.logger.debug('NOT AN ADMIN')
      redirect_to(pages_unauthorized_path)
    end
  end

  def allowed_to_view?
    redirect_to(pages_unauthorized_path) if Integer(params[:id], 10) != session[:memberID] && !session[:isAdmin]
  end
end
