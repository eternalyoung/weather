class WeatherReportsController < ApplicationController
  before_action :set_hourly_reports, except: %i[show current]

  def show
    @weather_report = WeatherReport.find(params[:id])
  end

  def current
    @weather_report = WeatherReport.find_by!(timestamp: current_hour_timestamp)
    render :show
  end

  def historical
    render :index
  end

  def historical_max
    @weather_report = @weather_reports.max_by(&:temperature)
    render :show
  end

  def historical_min
    @weather_report = @weather_reports.min_by(&:temperature)
    render :show
  end

  def historical_avg
    @average_temperature = @weather_reports.sum(&:temperature) / @weather_reports.size
    render :average
  end

  def by_time
    @weather_report = WeatherReport.find_by(timestamp: params[:timestamp])

    if @weather_report.nil?
      render "errors/404", status: 404
    else
      render :show
    end
  end

  private

  def set_hourly_reports
    @weather_reports = WeatherReport.order(timestamp: :asc).last(24)
  end

  def current_hour_timestamp
    current_time = Time.now
    Time.new(current_time.year, current_time.month, current_time.day, current_time.hour, 0, 0).to_i
  end
end
