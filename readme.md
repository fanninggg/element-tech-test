# Cron schedule calculator

An app which when fed a txt file of cron jobs and their schedule's will log the next scheduled trigger time for each job

## Usage

To get started using the cron job calculator:

1. git clone
2. bundle install
3. cat input.txt | ruby app.rb 'current_time' eg: cat input.txt | ruby app.rb 16:10

In order to get info from a new log file:

1. Add a new cron txt file to the main folder
2. Change the selected file in the app.rb as below
   ![Change selected file](https://i.imgur.com/JoNbZS5.png)

## Testing

- To run tests => rspec
- To run style tests => rubocop

## How does it work

For each cron job in the input file a new instance of the task class is created. This task instance takes the hour and minute data it is given as a number or an asterisk and creates a times attribute which is an array of the times at which the cron task triggers with hourday formatting.
For example a cron job with 45 in minutes slot and \* in the hour slot would become: 0145, 0245, 0345, etc

This list of times is then compared against the current_time passed by the user to determine if there are any upcoming trigger times. If there are not then the next trigger must occur tomorrow, if there are then the first upcoming time is the next trigger time.

Finally this data is printed out for the user via a view class
