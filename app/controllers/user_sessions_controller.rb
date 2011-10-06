class UserSessionsController < ApplicationController

  def new
    redirect_to current_user if signed_in?
    @user_session = UserSession.new
  end


  def create
    @user_session = UserSession.new(params[:user_session])
    @user = User.find_by_username(params[:user_session][:username])
    if !@user.nil?
     if @user.active?	
      if @user_session.save
        redirect_to home_url
      else
        render :action => "new" 
      end
     else 
	flash[:notice] = "Your Account is not active"
	render :action => "new"
	
     end
    else
	flash[:error]= "Enter correct login details"
	render :action => "new"
    end
  end

  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:success] = "Successfully Loggedout"
    redirect_to login_path, 
    
  end
end