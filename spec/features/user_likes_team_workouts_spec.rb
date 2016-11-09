require 'rails_helper'

RSpec.describe 'A user likes team workouts' do
  it 'shows the like underneath the workout' do
    team = FactoryGirl.create(:team)
    user_1 = FactoryGirl.create(:user, team: team)
    user_2 = FactoryGirl.create(:user, team: team)
    FactoryGirl.create(:workout, user: user_2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)

    visit '/team/workouts'

    within('.workout:first-of-type') do
      expect(page).not_to have_content('1 like')
      click_on 'Like'
    end

    within('.workout:first-of-type') do
      expect(page).to have_content('1 like')
    end
  end
end
