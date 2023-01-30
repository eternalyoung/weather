json.extract! weather_report, :id, :temperature, :timestamp
json.url weather_report_url(weather_report, format: :json)
