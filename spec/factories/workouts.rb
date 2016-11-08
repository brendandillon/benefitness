FactoryGirl.define do
  factory :workout do
    activity
    time_elapsed 1
    calories_burned 1
    distance 1.5
    user
    date Date.today
  end
end
