module ApplicationHelper
  def friendly_time(date_obj)
    date_obj.in_time_zone('Eastern Time (US & Canada)').strftime("%m/%d/%Y at %I:%M%p")
  end
end
