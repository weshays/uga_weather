require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  before(:each) {  }

  describe 'GET #show' do
    before :each do
      @data_params = {
        start_date: '2016-01-01',
        end_date: '2016-01-15',
        data_type: nil
      }
    end

    it 'should find a company by id' do
      get :show, params: @data_params
      expect(response.status).to eq(200)
    end

    it 'should return a 406 (Not Acceptable) if dates are invalid'
  end
end
