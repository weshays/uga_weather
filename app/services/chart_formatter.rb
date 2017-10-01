class ChartFormatter
  def initialize(start_date, end_date)
    @start_date = dateify(start_date, (Date.today - 1.month).beginning_of_month)
    @end_date = dateify(end_date, (Date.today - 1.month).end_of_month)
  end

  def process
    {
      start_date: @start_date,
      end_date: @end_date,
      categories: categories,
      data: categories.size.times.collect { |i| i }
    }
  end

  private

  def categories
    (@start_date...@end_date).collect { |date| date.to_s }
  end
  #
  # @readings = WeatherEntry.where('entered_on BETWEEN ? AND ?', @start_date, @end_date)
  #                         .order('name ASC, entered_on ASC')
  #
  # @categories = (@start_date...@end_date).collect { |date| date.to_s }
  #

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
