class DashboardController < ApplicationController
  def show
    @report = ChartFormatter.new(params[:start_date], params[:end_date])
  end
end
