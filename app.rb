# frozen_string_literal: true

require_relative 'task'
require_relative 'schedule_calculator'
require_relative 'view'

file = File.open('input.txt')
file_data = file.read
current_time = ARGV[0].delete(':').to_i

@calculator = ScheduleCalculator.new(current_time)
@view = View.new

tasks = file_data.split("\n").map do |task|
  Task.new(task)
end

tasks.each do |task|
  times = task.times.map(&:to_i)
  next_trigger = @calculator.next_trigger(times)
  if next_trigger
    @view.display_task(next_trigger.to_s, 'today', task.command)
  else
    @view.display_task(times[0].to_s, 'tomorrow', task.command)
  end
end
