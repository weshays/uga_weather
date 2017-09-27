require 'open-uri'

class WeatherDataService
  def initialize(date)
    @data_date = date
    @data = []
    @raw_data = ''
  end

  def process
    load_data_from_url
    parse_raw_data
    @data
  end

  private

  def url
    date_file = @data_date.strftime('%Y%m%d')
    "http://weather.ggy.uga.edu/data/archive/daily/#{date_file}.txt"
  end

  def load_data_from_url
    @raw_data = open(url) { |f| f.readlines }
    @raw_data.shift
    true
  end

  def parse_raw_data
    @raw_data.each do |row|
      row_data = row.gsub(/[ ]{2,}/, '||').strip.split('||')
      @data << {
        parameter: row_data[0],
        max_reading: row_data[1],
        max_time: convert_to_datetime(row_data[2]),
        min_reading: row_data[3],
        min_time: convert_to_datetime(row_data[4]),
        avg_reading: row_data[5]
      }
    end
    true
  end

  def convert_to_datetime(time_str)
    reading_time = Time.parse(time_str)
    DateTime.new(
      @data_date.year, @data_date.month, @data_date.day,
      reading_time.hour, reading_time.min, reading_time.sec,
      'EST'
    )
  end
end
