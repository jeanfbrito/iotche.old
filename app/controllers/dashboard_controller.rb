class DashboardController < ApplicationController
  def index
    @readings = Device.first.readings.all.last(50)
    @readings = @readings.map do |reading|
      [reading.created_at, reading.data['temperature']]
    end
  end
end