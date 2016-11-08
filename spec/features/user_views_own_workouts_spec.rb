require 'rails_helper'

RSpec.describe 'A user views their own workouts' do
  it 'shows all workouts for the week and a summary of the week' do
    user = FactoryGirl.create(:user)
    workout_1 = FactoryGirl.create(:workout, distance: 5, user: user, date: (Date.today))
    workout_2 = FactoryGirl.create(:workout, distance: 2, user: user, date: (Date.today - 1))
    workout_3 = FactoryGirl.create(:workout, distance: 43, user: user, date: (Date.today - 8))

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/'
    click_on 'My Workouts'
    
    expect(page).to have_content('5.0 miles')
    expect(page).to have_content('2.0 miles')
    expect(page).not_to have_content('43.0 miles')
    within('.summary') do
      expect(page).to have_content('7.0 miles')
    end
  end
end
