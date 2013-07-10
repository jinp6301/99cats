
class SessionsController < ApplicationController


  #before_filter :authenticate_user, only: :destroy

  def create
    user = User.find_by_username_and_password(params[:session][:username], params[:session][:password])
    if user
      user.session_token = SecureRandom::urlsafe_base64(16)
      user.save!

      session[:session_token] = user.session_token
      p "this is the create session token"
      p session[:session_token]

      flash[:notices] ||= []
      flash[:notices] << "You Logged In!"
      redirect_to "/cats"
    else
      render :new
    end
  end

  def destroy

    session_token = session[:session_token]
    print "this is a session token #{session_token}"
    user = User.find_by_session_token(session_token)
    user.session_token = nil
    user.save!
    reset_session

    flash[:notices] ||= []
    flash[:notices] << "You logged out. See you soon!"

    redirect_to new_session_url
  end

end
