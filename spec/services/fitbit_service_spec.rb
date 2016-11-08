require 'rails_helper'

RSpec.describe "Fitbit Service" do
  it 'syncs with a user' do
    user = FactoryGirl.create(:user)
    service = FitbitService.new("9876")
    allow_any_instance_of(FitbitService).to receive(:get_tokens).and_return({access_token: '1234', refresh_token: '4567'})

    service.sync(user)

    expect(user.fitbit_access_token).to eq('1234')
    expect(user.fitbit_refresh_token).to eq('4567')
  end
end
