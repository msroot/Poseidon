class UserController < ApplicationController

  def index 
    @users = User.all
  end
  
  def new
  end
  
end