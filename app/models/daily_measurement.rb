class DailyMeasurement
  include Virtus.model

  attribute :parameter, String
  attribute :max_reading, Float
  attribute :max_time, Time
  attribute :min_reading, Float
  attribute :min_time, Time
  attribute :average_reading, Float
end
