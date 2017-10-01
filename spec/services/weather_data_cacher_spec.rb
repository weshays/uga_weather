require 'rails_helper'

RSpec.describe WeatherDataCacher do
  before do
    @start_date = Date.parse('2017-09-01')
    @end_date = Date.parse('2017-09-02')
  end

  context 'instance methods' do
    it 'should load fine if given a valid date' do
      wdc = WeatherDataCacher.new(@start_date, @end_date)
      expect { wdc.process }.to_not raise_error
    end
  end
end
