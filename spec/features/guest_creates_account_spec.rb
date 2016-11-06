require 'rails_helper'

RSpec.describe "A guest creates an account" do
  it 'shows a user dashboard' do
    team = FactoryGirl.create(:team)

    visit '/'
    click_on 'Create Account'

    fill_in 'user_first_name', with: 'Pierre'
    fill_in 'user_last_name', with: 'Montfort'
    fill_in 'user_email', with: 'pierre@example.com'
    fill_in 'user_password', with: 'pass'
    fill_in 'user_password_confirmation', with: 'pass'
    fill_in 'team_code', with: team.code
    click_on 'Create'

    expect(current_path).to eq('/')
    expect(page).to have_content('Welcome, Pierre')
  end
end
