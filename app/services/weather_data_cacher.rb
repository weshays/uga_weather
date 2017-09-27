class WeatherDataCacher
  def initialize(start_date, end_date)
    @start_date = start_date
    @end_date = end_date
  end

  def process
    (@start_date..@end_date).each do |date|
      wds = WeatherDataService.new(date)
      @weather_data = wds.process
      @weather_data.each do |row|
        dm = DailyMeasurement.new(row)
        WeatherEntry.create(
          name: dm.parameter,
          max_reading: dm.max_reading,
          max_time: dm.max_time,
          min_reading: dm.min_reading,
          min_time: dm.min_time,
          avg_reading: dm.avg_reading,
          entered_on: date
        )
      end
    end
  end
end
