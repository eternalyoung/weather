class WeatherReportsController < ApplicationController
  # before_action :set_weather_report, only: %i[show update destroy]

  def current
    @weather_report = WeatherReport.find_by(timestamp: current_hour_timestamp)
    render json: @weather_report
  end

  def historical; end

  def historical_max; end

  def historical_min; end

  def historical_avg; end

  def by_time
    @weather_report = WeatherReport.find_by(timestamp: params[:timestamp])

    if @weather_report.nil?
      render json: { error: "Oops! Bad request" }, status: 400
    else
      render json: @weather_report
    end
  end

  private

  def current_hour_timestamp
    current_time = Time.now
    Time.new(current_time.year, current_time.month, current_time.day, current_time.hour, 0, 0, "+07:00").to_i
  end
end
