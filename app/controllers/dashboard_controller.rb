class DashboardController < ApplicationController
  def show
    wds = WeatherDataService.new
    weather_data = wds.process
    @readings = weather_data.collect do |row|
      DailyMeasurement.new(row)
    end
  end
end
