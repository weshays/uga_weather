class DashboardController < ApplicationController
  def show
    @data_date = params[:date].present? ? Date.parse(params[:date]) : Date.parse('2016-04-01')
    @readings = WeatherEntry.where('entered_on BETWEEN ? AND ?', @data_date - 2.days, @data_date + 2.days)
                            .order('name ASC, entered_on ASC')
  end
end
