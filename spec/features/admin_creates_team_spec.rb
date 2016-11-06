require 'rails_helper'

RSpec.describe "An admin creates a team" do
  it "shows the team" do
    admin = FactoryGirl.create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit '/'

    click_on 'Create New Team'

    fill_in 'team_name', with: 'Team Rocket'
    click_on 'Create Team'

    expect(current_path).to eq("/admin/teams/#{Team.last.id}")
    expect(page).to have_content('Team Rocket')
    within('.code') do
      expect(text.length).to eq(5)
      expect(text.to_i).to be_between(0, 99999)
    end
  end
end
