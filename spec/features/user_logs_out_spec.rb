require 'rails_helper'

RSpec.describe "A user logs out" do
  it "takes them to the guest home page" do
    user = FactoryGirl.create(:user, password: 'pass')

    visit '/'
    fill_in 'session_email', with: user.email
    fill_in 'session_password', with: 'pass'
    click_on 'Log in'
    click_on 'Log out'

    expect(page).to have_link('Create Account')
    expect(page).not_to have_content(user.first_name)
  end
end
