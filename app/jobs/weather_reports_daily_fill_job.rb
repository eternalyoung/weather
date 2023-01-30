class WeatherReportsDailyFillJob < ApplicationJob
  queue_as :default

  def perform
    response = HTTParty.get("http://dataservice.accuweather.com/currentconditions/v1/293708/historical/24?apikey=#{Rails.application.credentials.accuweather[:api_key]}&language=#{Rails.application.credentials.accuweather[:language]}")
    body = JSON.parse(response.body)
    body.each do |report|
      WeatherReportCreateJob.perform_later(report)
    end
  end
end
