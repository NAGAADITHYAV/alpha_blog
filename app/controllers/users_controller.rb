# user management
class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def index
  end

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to Alpha blog #{@user.username}, you have sucessfully signed up"
      redirect_to articles_path
    else
      render new
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password)
  end
end
