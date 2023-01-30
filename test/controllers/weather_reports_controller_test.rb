require "test_helper"

class WeatherReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @weather_report = weather_reports(:one)
  end

  test "should get index" do
    get weather_reports_url, as: :json
    assert_response :success
  end

  test "should create weather_report" do
    assert_difference("WeatherReport.count") do
      post weather_reports_url,
           params: { weather_report: { temperature: @weather_report.temperature, timestamp: @weather_report.timestamp } }, as: :json
    end

    assert_response :created
  end

  test "should show weather_report" do
    get weather_report_url(@weather_report), as: :json
    assert_response :success
  end

  test "should update weather_report" do
    patch weather_report_url(@weather_report),
          params: { weather_report: { temperature: @weather_report.temperature, timestamp: @weather_report.timestamp } }, as: :json
    assert_response :success
  end

  test "should destroy weather_report" do
    assert_difference("WeatherReport.count", -1) do
      delete weather_report_url(@weather_report), as: :json
    end

    assert_response :no_content
  end
end
