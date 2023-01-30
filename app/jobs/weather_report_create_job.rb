class WeatherReportCreateJob < ApplicationJob
  queue_as :default

  def perform(report)
    response_time = Time.at(report["EpochTime"])
    response_hour = if response_time.min >= 30
                      Time.new(response_time.year, response_time.month, response_time.day, response_time.hour + 1, 0, 0)
                    else
                      Time.new(response_time.year, response_time.month, response_time.day, response_time.hour, 0, 0)
                    end
    WeatherReport.create(
      timestamp: response_hour.to_i,
      temperature: report["Temperature"]["Metric"]["Value"]
    )
  end
end
