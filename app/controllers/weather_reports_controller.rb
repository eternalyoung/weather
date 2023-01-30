class WeatherReportsController < ApplicationController
  # before_action :set_weather_report, only: %i[show update destroy]

  def current
    @weather_report = WeatherReport.find_by(timestamp: current_hour_timestamp)
  end

  def historical; end

  def historical_max; end

  def historical_min; end

  def historical_avg; end

  def by_time; end

  private

  # def set_weather_report
  # end

  def current_hour_timestamp
    current_time = Time.now
    Time.new(current_time.year, current_time.month, current_time.day, current_time.hour, 0, 0).to_i
  end
end
