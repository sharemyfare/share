class UsersController < ApplicationController
  
  before_filter :authenticate, :except => [ :new, :create, :confirm , :confirmation ]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user, :only => [:destroy, :index]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def profile
    @user = User.find(@current_user.id)
  end

  def new
    redirect_to home_url if signed_in?
    @user = User.new
  end

  
  def create
    @user = User.new(params[:user])
    @user.confirmation = String.random_alphanumeric(10)
    
    if @user.save
	UserMailer.welcome_email(@user).deliver
	flash[:success] = "Please Check you mail and activate you account"
	redirect_to  login_path
    else
	render :action => "new"
    end
    
  end

  def confirmation
     @user = User.new(params[:user])
	render :layout => nil
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

      if @user.update_attributes(params[:user])
	flash[:success] = "User was successfully updated."
	redirect_to @user 
      else
        render :action => "edit"
      end

  end

  def passwordedit
    @user = User.find(params[:id])
  end

  def passwordupdate
    @user = User.find(params[:id])

      if @user.update_attributes(params[:user])
         redirect_to @user, :notice => "User was successfully updated."
      else
        render :action => "edit"
      end

  end


  def destroy
    @user = User.find(params[:id])
    @user.destroy
    @user.signout
    redirect_to signin_url
  end

  private
    def String.random_alphanumeric(size=16)
  	s = ""
  	size.times { s << (i = Kernel.rand(62); i += ((i < 10) ? 48 : ((i < 36) ? 55 : 61 ))).chr }
  	s
    end
end
