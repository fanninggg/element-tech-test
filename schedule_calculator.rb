# frozen_string_literal: true

# Calculates the next trigger of a cron task based on the current time and a list of all trigger times
class ScheduleCalculator
  def initialize(current_time)
    @current_time = current_time
  end

  def next_trigger(times)
    # If this returns nil, the next trigger is tomorrow
    times.find { |time| time >= @current_time }
  end
end
