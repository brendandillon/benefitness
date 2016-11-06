class HomeController < ApplicationController
  def show
    @user = current_user
    if @user && @user.admin?
      render 'admin/teams/index'
    elsif @user
      render 'user/dashboard/show'
    else
      render :dashboard
    end
  end
end
