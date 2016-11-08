class SessionsController < ApplicationController
  def create
    @user = User.find_by_email(params[:session][:email])
    
    if @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      fitbit = FitbitService.new
      fitbit.import_workouts(user)
    end

    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
