class DashboardController < ApplicationController
  def show
    @data_date = params[:date].present? ? Date.parse(params[:date]) : Date.today - 1.day
    wds = WeatherDataService.new(@data_date)
    @weather_data = wds.process
    @readings = @weather_data.collect do |row|
      DailyMeasurement.new(row)
    end
  end
end
