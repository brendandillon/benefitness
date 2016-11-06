class HomeController < ApplicationController
  def show
    if current_user.admin?
      redirect_to admin_dashboard_path
    end
  end
end
