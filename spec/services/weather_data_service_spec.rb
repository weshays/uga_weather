require 'rails_helper'

RSpec.describe WeatherDataService do
  before do
    @date_to_use = Date.parse('2017-09-27')
  end

  context 'instance methods' do
    it 'should load fine if given a valid date' do
      wds = WeatherDataService.new(@date_to_use)
      expect { wds.process }.to_not raise_error
    end
  end
end
