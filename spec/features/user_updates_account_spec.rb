require 'rails_helper'

RSpec.describe "A user updates their account" do
  it "allows them to log in with their new information" do
    user = FactoryGirl.create(:user, password: 'pass')

    visit '/'
    fill_in 'session_email', with: user.email
    fill_in 'session_password', with: 'pass'
    click_on 'Log in'
    click_on 'My Account'
    click_on 'Update Account'

    fill_in 'user_email', with: 'almond@ebay.horse'
    click_on 'Update'
    click_on 'Log out'

    fill_in 'session_email', with: 'almond@ebay.horse'
    fill_in 'session_password', with: 'pass'
    click_on 'Log in'

    expect(page).to have_content("Welcome, #{user.first_name}")
  end
end
  
