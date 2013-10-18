class SessionsController < ApplicationController
  def new
    @session = Session.new
  end

  def create
    @session = Session.new(params[:session])
    user = AuthenticationService.new(@session).authenticate!

    if user
      log_in!(user)
      redirect_to root_path
    else
      flash.now[:error] = "Invalid username or password."
      render :new
    end
  end

  def destroy
    log_out!
    redirect_to root_path
  end
end
