class AccountController < ApplicationController
  def show
  end

  def edit
    @user = current_user
  end
end
