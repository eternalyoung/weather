require "rails_helper"

RSpec.describe WeatherReport, type: :model do
  describe "WeatherReport" do
    context "when exists" do
      let!(:report) { create(:weather_report, timestamp: Time.parse("2016.10.09, 17:00").to_i) }

      it "has correct timestamp" do
        expect(report.timestamp).to eq(Time.parse("2016.10.09, 17:00").to_i)
      end

      it "has temperature" do
        expect(report.temperature.present?).to eq(true)
      end

      context "and creates with same timestamp" do
        let!(:second_report) { build(:weather_report, timestamp: Time.parse("2016.10.09, 17:00").to_i) }
        before { second_report.save }

        it "has error" do
          expect(second_report.errors.count).to eq(1)
        end

        it "isn't save" do
          expect(WeatherReport.all.size).to eq(1)
        end
      end
    end
  end
end
