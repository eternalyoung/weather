class WeatherReportCreateJob < ApplicationJob
  queue_as :default

  def perform(report)
    response_time = Time.new(report["EpochTime"])
    response_hour = Time.new(response_time.year, response_time.month, response_time.day, response_time.hour, 0, 0)
    WeatherReport.create(
      timestamp: response_hour.to_i,
      temperature: report["Temperature"]["Metric"]["Value"]
    )
  end
end
