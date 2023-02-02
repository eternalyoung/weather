FactoryBot.define do
  factory :weather_report do
    sequence(:temperature)

    current_time = Time.now
    hour_timestamp = Time.new(
      current_time.year,
      current_time.month,
      current_time.day,
      current_time.hour,
      0,
      0
    ).to_i

    timestamp { hour_timestamp }

    factory :weather_reports do
      after(:build) do
        23.times do |i|
          current_time = (i + 1).hours.ago
          hour_timestamp = Time.new(
            current_time.year,
            current_time.month,
            current_time.day,
            current_time.hour,
            0,
            0
          ).to_i
          create(:weather_report, timestamp: hour_timestamp)
        end
      end
    end
  end
end
