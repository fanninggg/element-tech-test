# frozen_string_literal: true

# Takes cron tasks and returns an instance which holds all potential times the job will trigger
class Task
  attr_reader :command, :times

  def initialize(task)
    @command = task.split(' ')[-1]
    @minutes = scheduled_minutes(task.split(' ').first(2)[0])
    @hours = scheduled_hours(task.split(' ').first(2)[1])
    @times = @hours.map { |hour| @minutes.map { |min| hour + min } }.flatten
  end

  private

  def scheduled_hours(hour)
    # Returns an array of all the hours this task is due to trigger
    return ('00'..'23').to_a if hour == '*'
    [hour]
  end

  def scheduled_minutes(minute)
    # Returns an array of all the minutes this task is due to trigger
    return ('00'..'60').to_a if minute == '*'
    [minute]
  end
end
