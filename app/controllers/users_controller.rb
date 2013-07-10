class UsersController < ApplicationController

  def create
    user = User.new(params[:user])
    if user.save!
      redirect_to "/cats"
    else
      render :new
    end
  end

end
