require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

scheduler.at '*/* 0:0:0:0' do
  WeatherReportsDailyFillJob.perform_later
end

scheduler.at '*/* *:0:0:0' do
  WeatherReportsHourlyFillJob.perform_later
end
