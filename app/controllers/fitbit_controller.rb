class FitbitController < ApplicationController
  def sync
    fitbit = FitbitService.new(params[:code])
    fitbit.sync(current_user)
    redirect_to root_path
  end
end
