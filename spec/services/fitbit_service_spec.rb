require 'rails_helper'

RSpec.describe "Fitbit Service" do
  it 'syncs with a user' do
    user = FactoryGirl.create(:user)
    service = FitbitService.new("9876")
    allow_any_instance_of(FitbitService).to receive(:get_tokens).and_return({access_token: '1234', refresh_token: '4567', user_id: '2'})

    service.sync(user)

    expect(user.fitbit_access_token).to eq('1234')
    expect(user.fitbit_refresh_token).to eq('4567')
    expect(user.fitbit_id).to eq('2')
  end

  it 'imports workouts' do
    user = FactoryGirl.create(:user, 
                              fitbit_access_token: '1234',
                              fitbit_refresh_token: '4567',
                              fitbit_id: '2'
                             )
    service = FitbitService.new
    allow_any_instance_of(FitbitService).to receive(:workouts_for_day).and_return({
      activities:[
          {
              activityId:51007,
              activityParentId:90019,
              calories:230,
              description:"7mph",
              distance:2.04,
              duration:1097053,
              hasStartTime:true,
              isFavorite:true,
              logId:1154701,
              name:"Treadmill, 0% Incline",
              startTime:"00:25",
              steps:3783
          }
      ],
      goals:{
          caloriesOut:2826,
          distance:8.05,
          floors:150,
          steps:10000
       },
      summary:{
          activityCalories:230,
          caloriesBMR:1913,
          caloriesOut:2143,
          distances:[
              {activity:"tracker", distance:1.32},
              {activity:"loggedActivities", distance:0},
              {activity:"total",distance:1.32},
              {activity:"veryActive", distance:0.51},
              {activity:"moderatelyActive", distance:0.51},
              {activity:"lightlyActive", distance:0.51},
              {activity:"sedentaryActive", distance:0.51},
              {activity:"Treadmill, 0% Incline", distance:3.28}
          ],
          elevation:48.77,
          fairlyActiveMinutes:0,
          floors:16,
          lightlyActiveMinutes:0,
          marginalCalories:200,
          sedentaryMinutes:1166,
          steps:0,
          veryActiveMinutes:0
      }
    }
  )

    service.import_workouts(user)
    last_workout = user.workouts.last

    expect(last_workout.distance).to eq(2.04)
    expect(last_workout.date).to eq(Date.today)
  end
end
