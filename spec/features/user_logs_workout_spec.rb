require 'rails_helper'

RSpec.describe "A user logs a workout" do
  it "shows the logged workout in a list of workouts" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:activity, name: 'Running')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/'
    click_on 'Log workout'

    select 'Running', from: 'workout_activity_id'
    fill_in 'workout_date', with: Date.today
    fill_in 'workout_distance', with: '6'
    fill_in 'workout_time_elapsed_minutes', with: '55'
    fill_in 'workout_calories_burned', with: '200'
    click_on 'Add workout'

    expect(current_path).to eq('/workouts')
    within('.workout') do
      expect(page).to have_content('Run')
      expect(page).to have_content('6.0 miles')
      expect(page).to have_content('55 minutes')
      expect(page).to have_content('200 calories burned')
    end
  end
end
