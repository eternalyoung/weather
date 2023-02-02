require "swagger_helper"

RSpec.describe "application", type: :request do
  path "/health" do
    get("health of application") do
      response(200, "OK") do
        tags "Health"
        produces "application/json"
        response(200, "OK") do
          schema type: :object,
                 properties: {
                   status: {
                     type: :string, example: "ok"
                   }
                 }

          let(:id) { WeatherReport.create(temperature: -1, timestamp: Time.now.to_i).id }
          run_test!
        end
      end
    end
  end

  path "/" do
    get("health of application") do
      response(200, "OK") do
        tags "Health"
        produces "application/json"
        response(200, "OK") do
          schema type: :object,
                 properties: {
                   status: {
                     type: :string, example: "ok"
                   }
                 }

          let(:id) { WeatherReport.create(temperature: -1, timestamp: Time.now.to_i).id }
          run_test!
        end
      end
    end
  end
end
