class UsersController < ApplicationController
  before_action :locate_user, only: [:show, :edit, :update]

  def index
  	@users = User.all
  end

  def new
    @user = User.new
  end

  def show
  	if session[:current_user_id]
  		@reservations = Reservation.all
  	else
  		redirect_to '/'
  	end
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
    	# Sets the User session and redirects to the User's show page
    	session[:current_user_id] = @user.id
    	redirect_to user_path(@user)
    else
    	render :new
    end
  end

  def edit
    #Only Admins can edit User accounts
    if current_user.admin
    else
      redirect_to user_path(current_user)
    end
  end

  def update
  	@user.update(name: user_params[:name], email: user_params[:email], telephone: user_params[:telephone], password: user_params[:password], password_confirmation: user_params[:password_confirmation])
    if @user.valid?
        flash[:success] = "You have sucessfully made your changes!"
        redirect_to user_path(@user)
    else
        flash[:error] = "Changes were NOT successful.  Please check your input data and try again."
        redirect_to edit_user_path(@user)
    end
  end

  def destroy
    if current_user.admin
    	User.find_by(id: params[:id]).destroy
    	redirect_to users_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :telephone, :image, :uid, :password, :password_confirmation)
  end

  def locate_user
    @user = User.find_by(id: params[:id])
  end
end