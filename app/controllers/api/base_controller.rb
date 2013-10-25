class Api::BaseController < ApplicationController
  respond_to :json

  before_action :login

  private

  def authenticate!
    head :unauthorized if not logged_in?
  end

  def login
    header_value = request.headers["X-TODO-Token"]
    @current_user = AuthenticationService.authenticate_from_headers(header_value)
  end
end
