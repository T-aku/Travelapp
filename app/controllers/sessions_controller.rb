class SessionsController < ApplicationController
  
  def new
    
  end
  
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:id] = user.id
      redirect_to users_path
    else
      render 'new'
    end
  end
  
  def destroy
    session[:id] = nil
    redirect_to root_path
  end
  
end