require 'rails_helper'

RSpec.describe 'A user views their team workouts' do
  it 'shows the team workouts for the last week in reverse order' do
    team = FactoryGirl.create(:team)
    user_1 = FactoryGirl.create(:user, team: team)
    user_2 = FactoryGirl.create(:user, team: team)
    user_3 = FactoryGirl.create(:user)

    workout_1 = FactoryGirl.create(:workout, distance: 5, user: user_1)
    workout_2 = FactoryGirl.create(:workout, distance: 2, user: user_2)
    workout_3 = FactoryGirl.create(:workout, distance: 43, user: user_3)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)

    visit '/'
    click_on 'Team Workouts'

    expect(page).to have_content('5.0 miles')
    expect(page).to have_content('2.0 miles')
    expect(page).not_to have_content('43.0 miles')
  end
end
