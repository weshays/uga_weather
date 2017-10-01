class DashboardController < ApplicationController
  def show
    @report = ChartFormatter.new(
      start_date: params[:start_date],
      end_date: params[:end_date],
      data_type: params[:data_type]
    ).process
  end
end
