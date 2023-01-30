class WeatherReportsDailyFillJob < ApplicationJob
  queue_as :default

  def perform
    response = HTTParty.get("http://dataservice.accuweather.com/currentconditions/v1/293708/historical/24?apikey=#{Rails.application.credentials.accuweather[:api_key]}&language=#{Rails.application.credentials.accuweather[:language]}")
    body = JSON.parse(response.body)
    response_time = Time.new(report["EpochTime"])
    response_hour = Time.new(response_time.year, response_time.month, response_time.day, response_time.hour, 0, 0)
    body.each do |report|
      WeatherReport.create(
        timestamp: response_hour.to_i,
        temperature: report["Temperature"]["Metric"]["Value"]
      )
    end
  end
end
