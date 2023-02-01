class WeatherReportCreateJob < ApplicationJob
  queue_as :default

  def perform(report)
    response_time = Time.at(report["EpochTime"])
    response_hour = Time.new(
      response_time.year,
      response_time.month,
      response_time.day,
      response_time.min >= 30 ? response_time.hour + 1 : response_time.hour,
      0,
      0
    )
    WeatherReport.create(
      timestamp: response_hour.to_i,
      temperature: report["Temperature"]["Metric"]["Value"]
    )
  end
end
