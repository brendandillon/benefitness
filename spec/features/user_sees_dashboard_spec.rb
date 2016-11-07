require 'rails_helper'

RSpec.describe "A user goes to their dashboard" do
  it "shows their last workout" do
    user = FactoryGirl.create(:user)
    workout = FactoryGirl.create(:workout, user_id: user.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/'

    expect(page).to have_content("#{workout.distance} mile #{workout.activity.name}")
  end
end
