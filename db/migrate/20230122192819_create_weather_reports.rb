class CreateWeatherReports < ActiveRecord::Migration[7.0]
  def change
    create_table :weather_reports do |t|
      t.float :temperature, nil: false
      t.integer :timestamp, nil: false, unique: true

      t.timestamps
    end
  end
end
