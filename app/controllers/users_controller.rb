class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @team = Team.find_by_code(params[:team_code])
    @user = @team.users.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      @user.update(last_logged_in: Date.today)
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to root_path
    else
      render 'account/edit'
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
