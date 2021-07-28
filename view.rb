# frozen_string_literal: true

# Responsible for getting and displaying data to the user
class View
  def display_task(time, day, command)
    time_display = if time == '0'
                     '00:00'
                   elsif time.length == 1
                     "00:0#{time}"
                   elsif time.length == 2
                     "00:#{time}"
                   elsif time.length == 3
                     time.insert(1, ':')
                   else
                     time.insert(2, ':')
                   end
    puts "#{time_display} #{day} - #{command}"
  end
end
