class WeatherReportsController < ApplicationController
  before_action :set_hourly_reports, except: %i[show current]

  def show
    @weather_report = WeatherReport.find(params[:id])
  end

  def current
    @weather_report = WeatherReport.find_by(timestamp: current_hour_timestamp)
    render :show
  end

  def historical
    render :index
  end

  def historical_max
    @weather_report = @weather_reports.max_by(&:temperature)
    render :index
  end

  def historical_min
    @weather_report = @weather_reports.min_by(&:temperature)
    render :index
  end

  def historical_avg
    avg = @weather_reports.sum(&:temperature) / weather_reports.size
    render json: avg.round(2)
  end

  def by_time
    @weather_report = WeatherReport.find_by(timestamp: params[:timestamp])

    if @weather_report.nil?
      render json: { error: "Oops! Looks like we don't have it" }, status: 404
    else
      render :show
    end
  end

  private

  def set_hourly_reports
    @weather_reports = WeatherReport.last(24)
  end

  def current_hour_timestamp
    current_time = Time.now.utc
    Time.new(current_time.year, current_time.month, current_time.day, current_time.hour, 0, 0).to_i
  end
end
