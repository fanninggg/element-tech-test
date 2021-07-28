# frozen_string_literal: true

require_relative '../task'

RSpec.describe Task do
  before do
    @task = Task.new('30 1 /bin/run_me_daily')
  end

  describe '#initialize' do
    it 'creates a new instance of task when passed a task schedule string' do
      expect(@task).to be_instance_of(Task)
    end
  end

  describe '#scheduled_minutes' do
    it 'returns an array' do
      expect(@task.send(:scheduled_minutes, '30')).to be_a_kind_of(Array)
    end

    it 'returns an array of all 60 minutes when passed *' do
      # Expecting length of 61 as it includes 00 throught to 60
      expect(@task.send(:scheduled_minutes, '*')).to have_attributes(size: 61)
    end
  end

  describe '#scheduled_hours' do
    it 'returns an array' do
      expect(@task.send(:scheduled_hours, '30')).to be_a_kind_of(Array)
    end

    it 'returns an array of all 24 hours when passed *' do
      expect(@task.send(:scheduled_hours, '*')).to have_attributes(size: 24)
    end
  end
end
