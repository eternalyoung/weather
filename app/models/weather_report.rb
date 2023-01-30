class WeatherReport < ApplicationRecord
  validates :timestamp, presence: true
  validates :timestamp, uniqueness: true

  validates :temperature, presence: true
end
