class Admin::TeamsController < ApplicationController
  def index
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to admin_team_path(@team)
    else
      render :new
    end
  end

  def show
    @team = Team.find_by_id(params[:id])
  end

  private
    def team_params
      params.require(:team).permit(:name)
    end
end
