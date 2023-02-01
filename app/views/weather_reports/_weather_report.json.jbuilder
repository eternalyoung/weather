json.type weather_report.class.name
json.id weather_report.id
json.attributes { json.extract! weather_report, :temperature, :timestamp }
json.links do
  json.self weather_report_url(weather_report, format: :json)
end
