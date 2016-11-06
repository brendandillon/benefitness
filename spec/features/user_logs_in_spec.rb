require 'rails_helper'

RSpec.describe "A user logs in" do
  it "shows the user's dashboard" do
    user = FactoryGirl.create(:user, password: 'pass')

    visit '/'
    fill_in 'session_email', with: user.email
    fill_in 'session_password', with: 'pass'
    click_on 'Log in'

    expect(current_path).to eq('/')
    expect(page).to have_content("Welcome, #{user.first_name}")
  end
end
