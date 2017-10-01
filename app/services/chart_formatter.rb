class ChartFormatter
  def initialize(options)
    @start_date = dateify(options[:start_date], (Date.today - 1.month).beginning_of_month)
    @end_date = dateify(options[:end_date], (Date.today - 1.month).end_of_month)
    @data_type = options[:data_type] || menu_options.first[:name]
  end

  def process
    {
      data_type: @data_type,
      start_date: @start_date,
      end_date: @end_date,
      categories: categories,
      data: formatted_data,
      menu: menu_options
    }
  end

  private

  def menu_options
    WeatherEntry.select(:name)
                .where('entered_on BETWEEN ? AND ?', @start_date, @end_date)
                .group(:name)
                .order('name ASC').collect do |weather_entry|
      { name: weather_entry.name, path: "/dashboard?data_type=#{weather_entry.name}" }
    end
  end

  def categories
    (@start_date..@end_date).collect { |date| date.to_s }
  end

  def formatted_data
    values = { min: [], avg: [], max: [] }
    WeatherEntry.select(:min_reading, :avg_reading, :max_reading)
                .where('entered_on BETWEEN ? AND ?', @start_date, @end_date)
                .where(name: @data_type)
                .order('entered_on ASC')
                .each do |weather_entry|
      values[:min] << weather_entry.min_reading
      values[:avg] << weather_entry.avg_reading
      values[:max] << weather_entry.max_reading
    end
    [
      { name: 'Max Reading', data: values[:max] },
      { name: 'Avg Reading', data: values[:avg] },
      { name: 'Min Reading', data: values[:min] }
    ]
  end

  def dateify(date_str_or_obj, default_date = nil)
    retval = convert_to_date(date_str_or_obj.to_s)
    return default_date if retval.nil?
    retval
  end

  def convert_to_date(date_str)
    if date_str =~ /^[0-9]{4}-[0-9]{2}-[0-9]{2}$/ # '1980-09-27'
      Date.strptime(date_str.to_s.strip, '%Y-%m-%d')
    elsif date_str =~ %r(^[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{4}$)    # '09/27/1980' and '9/27/1980'
      Date.strptime(date_str.to_s.strip, '%m/%d/%Y')
    elsif date_str =~ %r(^[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{2}$)    # '09/27/80' and '9/27/80'
      Date.strptime(date_str.to_s.strip, '%m/%d/%y')
    elsif !date_str.nil?
      Date.parse(date_str) # anything else that is valid by default
    end
  rescue
    nil
  end
end
