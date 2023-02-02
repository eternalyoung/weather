require "swagger_helper"

RSpec.describe "weather_reports", type: :request do
  path "/weather_reports/{id}" do
    get("show weather report") do
      tags "Reports"
      produces "application/json"
      parameter name: "id", in: :path, type: :integer, description: "ID of report"
      response(200, "OK") do
        schema type: :object,
               properties: {
                 data: {
                   type: :object,
                   properties: {
                     type: { type: :string },
                     id: { type: :integer },
                     attributes: {
                       type: :object,
                       properties: {
                         temperature: { type: :number },
                         timestamp: { type: :integer }
                       }
                     },
                     links: {
                       type: :object,
                       properties: {
                         self: { type: :string }
                       }
                     }
                   }
                 }
               }

        let(:id) { WeatherReport.create(temperature: -1, timestamp: Time.now.to_i).id }
        run_test!
      end
      response(404, "Not Found") do
        schema type: :object,
               properties: {
                 errors: {
                   type: :object,
                   properties: {
                     status: { type: :string, example: "404" },
                     title: { type: :string, example: "Not Found" },
                     detail: { type: :string, example: "Couldn't find WeatherReport with 'id'=1" }
                   }
                 }
               }

        let(:id) { "invalid" }
        run_test!
      end
    end
  end

  path "/weather/current" do
    get("show current weather report") do
      tags "Reports"
      produces "application/json"
      response(200, "OK") do
        schema type: :object,
               properties: {
                 data: {
                   type: :object,
                   properties: {
                     type: { type: :string },
                     id: { type: :integer },
                     attributes: {
                       type: :object,
                       properties: {
                         temperature: { type: :number },
                         timestamp: { type: :integer }
                       }
                     },
                     links: {
                       type: :object,
                       properties: {
                         self: { type: :string }
                       }
                     }
                   }
                 }
               }

        let(:id) { WeatherReport.create(temperature: -1, timestamp: Time.now.to_i).id }
        run_test!
      end
      response(404, "Not Found") do
        schema type: :object,
               properties: {
                 errors: {
                   type: :object,
                   properties: {
                     status: { type: :string, example: "404" },
                     title: { type: :string, example: "Not Found" },
                     detail: { type: :string, example: "Couldn't find WeatherReport with 'id'=1" }
                   }
                 }
               }

        let(:id) { WeatherReport.create(temperature: -1, timestamp: Time.now.to_i).id }
        run_test!
      end
    end
  end

  path "/weather/historical" do
    get("shows weather reports for the last 24 hours") do
      tags "Reports", "Historical"
      produces "application/json"
      response(200, "OK") do
        schema type: :object,
               properties: {
                 data: {
                   type: :array,
                   items: {
                     type: :object,
                     properties: {
                       type: { type: :string },
                       id: { type: :integer },
                       attributes: {
                         type: :object,
                         properties: {
                           temperature: { type: :number },
                           timestamp: { type: :integer }
                         }
                       },
                       links: {
                         type: :object,
                         properties: {
                           self: { type: :string }
                         }
                       }
                     }
                   }
                 }
               }

        let(:id) { WeatherReport.create(temperature: -1, timestamp: Time.now.to_i).id }
        run_test!
      end
    end
  end

  path "/weather/historical/max" do
    get("shows weather report with the highest temperature in the last 24 hours") do
      tags "Reports", "Historical"
      produces "application/json"
      response(200, "OK") do
        schema type: :object,
               properties: {
                 data: {
                   type: :object,
                   properties: {
                     type: { type: :string },
                     id: { type: :integer },
                     attributes: {
                       type: :object,
                       properties: {
                         temperature: { type: :number },
                         timestamp: { type: :integer }
                       }
                     },
                     links: {
                       type: :object,
                       properties: {
                         self: { type: :string }
                       }
                     }
                   }
                 }
               }

        let(:id) { WeatherReport.create(temperature: -1, timestamp: Time.now.to_i).id }
        run_test!
      end
    end
  end

  path "/weather/historical/min" do
    get("shows weather report with the lowest temperature in the last 24 hours") do
      tags "Reports", "Historical"
      produces "application/json"
      response(200, "OK") do
        schema type: :object,
               properties: {
                 data: {
                   type: :object,
                   properties: {
                     type: { type: :string },
                     id: { type: :integer },
                     attributes: {
                       type: :object,
                       properties: {
                         temperature: { type: :number },
                         timestamp: { type: :integer }
                       }
                     },
                     links: {
                       type: :object,
                       properties: {
                         self: { type: :string }
                       }
                     }
                   }
                 }
               }

        let(:id) { WeatherReport.create(temperature: -1, timestamp: Time.now.to_i).id }
        run_test!
      end
    end
  end

  path "/weather/historical/avg" do
    get("shows weather report with the lowest temperature in the last 24 hours") do
      tags "Reports", "Historical"
      produces "application/json"
      response(200, "OK") do
        schema type: :object,
               properties: {
                 data: {
                   type: :object,
                   properties: {
                     average_temperature: { type: :number }
                   }
                 }
               }

        let(:id) { WeatherReport.create(temperature: -1, timestamp: Time.now.to_i).id }
        run_test!
      end
    end
  end

  path "/weather/by_time" do
    get("show weather report") do
      tags "Reports"
      produces "application/json"
      parameter name: "timestamp", in: :query, type: :integer, description: "Timestamp of report"
      response(200, "OK") do
        schema type: :object,
                properties: {
                  data: {
                    type: :object,
                    properties: {
                      type: { type: :string },
                      id: { type: :integer },
                      attributes: {
                        type: :object,
                        properties: {
                          temperature: { type: :number },
                          timestamp: { type: :integer }
                        }
                      },
                      links: {
                        type: :object,
                        properties: {
                          self: { type: :string }
                        }
                      }
                    }
                  }
                }

        let(:id) { WeatherReport.create(temperature: -1, timestamp: Time.now.to_i).id }
        run_test!
      end
      response(404, "Not Found") do
        schema type: :object,
                properties: {
                  errors: {
                    type: :object,
                    properties: {
                      status: { type: :string, example: "404" },
                      title: { type: :string, example: "Not Found" }
                    }
                  }
                }

        let(:id) { "invalid" }
        run_test!
      end
    end
  end
end
