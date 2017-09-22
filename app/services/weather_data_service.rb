require 'open-uri'

class WeatherDataService
  def initialize
    @url = 'http://weather.ggy.uga.edu/data/archive/daily/20090101.txt'
    @data = []
    @raw_data = ''
  end

  def process
    load_data_from_url
    parse_raw_data
    @data
  end

  def load_data_from_url
    @raw_data = open(@url) { |f| f.readlines }
  end

  def parse_raw_data
    @raw_data.each do |row|
      row_data = row.gsub(/[ ]{2,}/, '||').strip.split('||')
      @data << {
        parameter: row_data[0],
        max_reading: row_data[1],
        max_time: row_data[2],
        min_reading: row_data[3],
        min_time: row_data[4],
        average: row_data[5]
      }
    end
  end
end
