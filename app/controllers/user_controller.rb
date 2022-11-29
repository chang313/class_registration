class UserController < ApplicationController
  # show all user list 
  def index
    @users = User.all
  end

  # show selection page of 20 min or 40 min class
  def show
    @user = User.find(params[:id])
  end

end


