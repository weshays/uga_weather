# Tasks

* Database migration to create table to store weather data.
  - You can use the image I sent you as a guide, or come up with your own way.

* Create ActiveRecord model for table.

* Create service object to pull down and story data for all of 2016.
  - If you want to do more years that is fine too.

* Update frontend to include data for +/- 2 days.
  - You can be creative with this

* Your controller must pull from the database.


# Load Data
start_date = Date.parse('2016-01-01')
end_date = Date.parse('2016-12-31')
wdc = WeatherDataCacher.new(start_date, end_date)
wdc.process
