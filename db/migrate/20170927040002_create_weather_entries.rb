class CreateWeatherEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :weather_entries do |t|
      t.string :name
      t.float :max_reading
      t.datetime :max_time
      t.float :min_reading
      t.datetime :min_time
      t.float :avg_reading
      t.date :entered_on
    end
  end
end
