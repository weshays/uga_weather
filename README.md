# Tasks

* Use data in highcharts

* Give UI some options for updating the data.

* Give UI option for a date range, month, or week.


# Load Data
start_date = Date.parse('2016-01-01')
end_date = Date.parse('2016-12-31')
wdc = WeatherDataCacher.new(start_date, end_date)
wdc.process
