class UsersController < ApplicationController
  
  def show
  	@user = User.find(params[:id])
  end

  def new
  	# @ sign creates a variable
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      log_in @user
      flash[:success] = "Welcome."
      redirect_to @user
  		# successful signup, handle
  	else
  		render 'new'
  	end
  end

  private

  	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation)
  	end

end
