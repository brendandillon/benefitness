require 'rails_helper'

RSpec.describe "A user views their account" do
  it "shows their full name and team name" do
    user = FactoryGirl.create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/'
    click_on 'My Account'

    expect(page).to have_content("#{user.first_name} #{user.last_name}")
    expect(page).to have_content(user.team.name)
  end
end
